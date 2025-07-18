import { Request } from "express";
import prisma from "../../../../shared/prisma";
import { Word, Topic, Level } from "@prisma/client";

// Normalize casing of a string
const normalizeCasing = (str: string) => str.toLowerCase().trim();
// Create a new word
const createWord = async (
  req: Request,
  userId: string
): Promise<Word | { message: string }> => {
  const {
    value,
    meaning,
    sentences,
    levelId,
    topicId,
    articleId,
    partOfSpeechId,
    pluralForm,
    synonyms = [],
    antonyms = [],
    similarWords = [],
  } = req.body || {};

  if (!value || !meaning || meaning.length === 0) {
    return { message: "Word value and meaning are required" };
  }

  const normalizedValue = normalizeCasing(value);
  const normalizedMeaning = meaning.map(normalizeCasing);

  // Check if the word already exists
  const existingWord = await prisma.word.findUnique({
    where: { value: normalizedValue },
  });

  if (existingWord) {
    return { message: `The word '${normalizedValue}' already exists` };
  }

  const parsedIds = {
    levelId: parseInt(levelId, 10),
    topicId: topicId ? parseInt(topicId, 10) : 0,
    articleId: articleId ? parseInt(articleId, 10) : 0,
    partOfSpeechId: partOfSpeechId ? parseInt(partOfSpeechId, 10) : 0,
  };

  // Insert Word Data
  const newWord = await prisma.word.create({
    data: {
      value: normalizedValue,
      meaning: normalizedMeaning,
      sentences,
      pluralForm: pluralForm ? normalizeCasing(pluralForm) : null,
      ...parsedIds,

      modifiedFields: [
        "value",
        ...(normalizedMeaning.length > 0 ? ["meaning"] : []),
        ...(sentences?.length ? ["sentences"] : []),
        ...(pluralForm ? ["pluralForm"] : []),
        ...(synonyms.length ? ["synonyms"] : []),
        ...(antonyms.length ? ["antonyms"] : []),
        ...(similarWords.length ? ["similarWords"] : []),
      ],
      createdBy: userId,
    },
  });

  // Handle relations (synonyms, antonyms, similarWords)
  if (synonyms.length > 0) {
    await handleRelations(synonyms, "synonyms", newWord.id, parsedIds, userId);
  }
  if (antonyms.length > 0) {
    await handleRelations(antonyms, "antonyms", newWord.id, parsedIds, userId);
  }
  if (similarWords.length > 0) {
    await handleRelations(
      similarWords,
      "similarWords",
      newWord.id,
      parsedIds,
      userId
    );
  }

  return newWord;
};

// Handle word relations (synonyms, antonyms, similarWords)
const handleRelations = async (
  words: string[],
  relation: string,
  newWordId: number,
  metadata: {
    levelId: number;
    topicId: number;
    articleId: number;
    partOfSpeechId: number;
  },
  createdBy: string
) => {
  for (const word of words) {
    const normalizedWord = normalizeCasing(word);
    const wordEntity = await prisma.word.upsert({
      where: { value: normalizedWord },
      update: {},
      create: {
        value: normalizedWord,
        meaning: [],
        sentences: [],
        ...metadata,
        createdBy,
      },
    });

    // Connect relation
    await prisma.word.update({
      where: { id: newWordId },
      data: {
        [relation]: {
          connect: { id: wordEntity.id },
        },
      },
    });

    // Reciprocal relation logic for synonyms and antonyms
    const reverseRelation =
      relation === "synonyms"
        ? "synonyms"
        : relation === "antonyms"
        ? "antonyms"
        : null;
    if (reverseRelation) {
      await prisma.word.update({
        where: { id: wordEntity.id },
        data: {
          [reverseRelation]: {
            connect: { id: newWordId },
          },
        },
      });
    }
  }
};

// ===================get all words====================
interface GetWordsListParams {
  showAll: boolean;
  page: number;
  limit: number;
  level: string;
  topic: string;
}

interface GetWordsListResult {
  words: Word[];
  currentPage: number | null;
  totalPages: number | null;
  totalWords: number;
  levels: Level[];
  topics: Topic[];
}

export const getWordsListFromDB = async (
  params: GetWordsListParams
): Promise<GetWordsListResult> => {
  const { showAll, page, limit, level, topic } = params;

  const skip = (page - 1) * limit;
  const take = limit;

  const whereConditions: any = {};
  let filteredTopics: Topic[] = [];

  // Level filtering
  if (level) {
    const levelRecord = await prisma.level.findUnique({
      where: { level: level, deletedAt: null },
    });

    if (levelRecord) {
      whereConditions.levelId = levelRecord.id;
      filteredTopics = await prisma.topic.findMany({
        where: {
          words: { some: { levelId: levelRecord.id } },
        },
      });
    }
  }

  // Topic filtering
  if (topic) {
    const topicRecord = await prisma.topic.findUnique({
      where: { name: topic },
    });
    if (topicRecord) whereConditions.topicId = topicRecord.id;
  }

  // Get paginated words
  const words = await prisma.word.findMany({
    where: whereConditions,
    skip: showAll ? undefined : skip,
    take: showAll ? undefined : take,
    include: {
      level: true,
      topic: true,
      article: true,
      partOfSpeech: true,
      synonyms: true,
      antonyms: true,
      similarWords: true,
      // creator: true,
      creator: {
        select: {
          name: true,
          email: true,
        },
      },
      history: {
        include: {
          user: {
            select: {
              name: true,
              email: true,
            },
          },
        },
      },
    },
    orderBy: { value: "asc" },
  });

  // Get total count
  const totalWords = await prisma.word.count({ where: whereConditions });

  // Get available levels
  const levels = await prisma.level.findMany({
    distinct: ["level"],
    where: { deletedAt: null },
  });

  // Get appropriate topics
  const topics = level
    ? filteredTopics
    : await prisma.topic.findMany({ distinct: ["name"] });

  return {
    words,
    currentPage: showAll ? null : page,
    totalPages: showAll ? null : Math.ceil(totalWords / limit),
    totalWords,
    levels,
    topics,
  };
};
// =================get single word =============================
export interface GetSingleWordResult extends Word {
  level: Level;
  topic: Topic;
  article: any;
  partOfSpeech: any;
  synonyms: Word[];
  antonyms: Word[];
  similarWords: Word[];
}

// Add to existing service
export const getSingleWordFromDB = async (
  identifier: string
): Promise<GetSingleWordResult | null> => {
  const isId = !isNaN(Number(identifier));

  const whereCondition = isId
    ? { id: Number(identifier) }
    : { value: identifier.toLowerCase().trim() };

  const word = await prisma.word.findFirst({
    where: whereCondition,
    include: {
      level: true,
      topic: true,
      article: true,
      partOfSpeech: true,
      synonyms: true,
      antonyms: true,
      similarWords: true,
    },
  });

  return word as GetSingleWordResult | null;
};

// =============================update word ==========================================
interface UpdateWordPayload {
  value: string;
  meaning: string[];
  sentences: string[];
  levelId: string;
  topicId: string;
  articleId: string;
  partOfSpeechId: string;
  pluralForm?: string;
  synonyms: string[];
  antonyms: string[];
  similarWords: string[];
  createdBy: string;
}

// interface Metadata {
//   levelId: number;
//   topicId: number;
//   articleId: number;
//   partOfSpeechId: number;
// }

// const handleUpdateRelations = async (
//   words: string[],
//   relation: "synonyms" | "antonyms" | "similarWords",
//   wordId: number,
//   metadata: Metadata
// ) => {
//   for (const word of words) {
//     const normalizedWord = normalizeCasing(word);
//     const wordEntity = await prisma.word.upsert({
//       where: { value: normalizedWord },
//       update: {},
//       create: {
//         value: normalizedWord,
//         meaning: [],
//         sentences: [],
//         ...metadata,
//       },
//     });

//     await prisma.word.update({
//       where: { id: wordId },
//       data: { [relation]: { connect: { id: wordEntity.id } } },
//     });

//     const reverseRelation =
//       relation === "synonyms"
//         ? "synonyms"
//         : relation === "antonyms"
//         ? "antonyms"
//         : "similarWords";

//     await prisma.word.update({
//       where: { id: wordEntity.id },
//       data: { [reverseRelation]: { connect: { id: wordId } } },
//     });
//   }
// };

// export const updateWordInDB = async (
//   wordId: number,
//   payload: UpdateWordPayload
// ): Promise<Word | { message: string }> => {
//   // Validate required fields
//   if (!payload.value || !payload.meaning) {
//     return { message: "Value and meaning are required" };
//   }

//   // Parse IDs
//   const parsedIds = {
//     levelId: parseInt(payload.levelId, 10),
//     topicId: parseInt(payload.topicId, 10),
//     articleId: parseInt(payload.articleId, 10),
//     partOfSpeechId: parseInt(payload.partOfSpeechId, 10),
//   };

//   if (Object.values(parsedIds).some(isNaN)) {
//     return { message: "Invalid ID values provided" };
//   }

//   // Check word exists
//   const existingWord = await prisma.word.findUnique({ where: { id: wordId } });
//   if (!existingWord) {
//     return { message: "Word not found" };
//   }

//   // Update main word
//   const updatedWord = await prisma.word.update({
//     where: { id: wordId },

//     data: {
//       value: normalizeCasing(payload.value),
//       meaning: payload.meaning.map(normalizeCasing),
//       sentences: payload.sentences,
//       ...parsedIds,
//       pluralForm: payload.pluralForm
//         ? normalizeCasing(payload.pluralForm)
//         : null,
//     },
//   });

//   // Handle relationships
//   await handleUpdateRelations(payload.synonyms, "synonyms", wordId, parsedIds);
//   await handleUpdateRelations(payload.antonyms, "antonyms", wordId, parsedIds);
//   await handleUpdateRelations(
//     payload.similarWords,
//     "similarWords",
//     wordId,
//     parsedIds
//   );

//   return updatedWord;
// };

// const handleUpdateRelations = async (
//   words: string[],
//   relation: "synonyms" | "antonyms" | "similarWords",
//   wordId: number
// ) => {
//   for (const word of words) {
//     const normalizedWord = normalizeCasing(word);
//     const wordEntity = await prisma.word.upsert({
//       where: { value: normalizedWord },
//       update: {},
//       create: {
//         value: normalizedWord,
//         meaning: [],
//         sentences: [],
//       },
//     });

//     await prisma.word.update({
//       where: { id: wordId },
//       data: { [relation]: { connect: { id: wordEntity.id } } },
//     });

//     const reverseRelation =
//       relation === "synonyms"
//         ? "synonyms"
//         : relation === "antonyms"
//         ? "antonyms"
//         : "similarWords";

//     await prisma.word.update({
//       where: { id: wordEntity.id },
//       data: { [reverseRelation]: { connect: { id: wordId } } },
//     });
//   }
// };

const handleUpdateRelations = async (
  words: string[],
  relation: "synonyms" | "antonyms" | "similarWords",
  wordId: number,
  createdBy: string
) => {
  // First, remove all existing relations
  await prisma.word.update({
    where: { id: wordId },
    data: { [relation]: { set: [] } }, // This disconnects all existing relations
  });

  for (const word of words) {
    const normalizedWord = normalizeCasing(word);
    const wordEntity = await prisma.word.upsert({
      where: { value: normalizedWord },
      update: {},
      // create: {
      //   value: normalizedWord,
      //   meaning: [],
      //   sentences: [],
      // },
      create: {
        value: normalizedWord,
        meaning: [],
        sentences: [],
        createdBy, // or pass a valid userId
        // levelId: 6, // or some default or passed value
        // topicId: 1, // if not nullable
        // articleId: 4, // if not nullable
        // partOfSpeechId: 0, // if not nullable
      },
    });

    await prisma.word.update({
      where: { id: wordId },
      data: { [relation]: { connect: { id: wordEntity.id } } },
    });

    const reverseRelation =
      relation === "synonyms"
        ? "synonyms"
        : relation === "antonyms"
        ? "antonyms"
        : "similarWords";

    await prisma.word.update({
      where: { id: wordEntity.id },
      data: { [reverseRelation]: { connect: { id: wordId } } },
    });
  }
};

export const updateWordInDB = async (
  wordId: number,
  payload: UpdateWordPayload,
  userId: string
): Promise<Word | { message: string }> => {
  const {
    value,
    meaning,
    sentences,
    pluralForm,
    levelId,
    topicId,
    articleId,
    partOfSpeechId,
    synonyms,
    antonyms,
    similarWords,
  } = payload;

  // Validation
  if (!value || !meaning) {
    return { message: "Value and meaning are required" };
  }

  const parsedIds = {
    levelId: parseInt(levelId, 10),
    topicId: parseInt(topicId, 10),
    articleId: parseInt(articleId, 10),
    partOfSpeechId: parseInt(partOfSpeechId, 10),
  };

  if (Object.values(parsedIds).some(isNaN)) {
    return { message: "Invalid ID values provided" };
  }

  const existingWord = await prisma.word.findUnique({ where: { id: wordId } });
  if (!existingWord) {
    return { message: "Word not found" };
  }

  const normalizedValue = normalizeCasing(value);
  const normalizedMeaning = meaning.map(normalizeCasing);

  // Clear existing relations
  await prisma.word.update({
    where: { id: wordId },
    data: {
      synonyms: { set: [] },
      antonyms: { set: [] },
      similarWords: { set: [] },
    },
  });

  // Update word fields
  const updatedWord = await prisma.word.update({
    where: { id: wordId },
    data: {
      value: normalizedValue,
      meaning: normalizedMeaning,
      sentences,
      pluralForm: pluralForm ? normalizeCasing(pluralForm) : null,
      ...parsedIds,

      modifiedFields: [
        "value",
        ...(normalizedMeaning.length ? ["meaning"] : []),
        ...(sentences?.length ? ["sentences"] : []),
        ...(pluralForm ? ["pluralForm"] : []),
        ...(synonyms.length ? ["synonyms"] : []),
        ...(antonyms.length ? ["antonyms"] : []),
        ...(similarWords.length ? ["similarWords"] : []),
      ],
    },
  });

  await prisma.wordHistory.create({
    data: {
      wordId: wordId,
      value: normalizedValue,
      meaning: normalizedMeaning,
      sentences,
      pluralForm: pluralForm ? normalizeCasing(pluralForm) : null,
      modifiedFields: updatedWord.modifiedFields,
      oldData: existingWord, // optional — can be omitted if not needed
      newData: {
        value: normalizedValue,
        meaning: normalizedMeaning,
        sentences,
        pluralForm: pluralForm ? normalizeCasing(pluralForm) : null,
      },
      userId: userId,
    },
  });

  // Recreate relations
  await handleRelations(synonyms, "synonyms", wordId, parsedIds, userId);
  await handleRelations(antonyms, "antonyms", wordId, parsedIds, userId);
  await handleRelations(
    similarWords,
    "similarWords",
    wordId,
    parsedIds,
    userId
  );

  return updatedWord;
};

// export const deleteWordFromDB = async (
//   wordId: number
// ): Promise<{ message: string; deletedWord?: Word }> => {
//   const existingWord = await prisma.word.findUnique({
//     where: { id: wordId },
//   });

//   if (!existingWord) {
//     return { message: "Word not found" };
//   }

//   const deletedWord = await prisma.word.delete({
//     where: { id: wordId },
//   });

//   return { message: "Word deleted successfully", deletedWord };
// };

// export const deleteWordFromDB = async (wordId: number, userId: string) => {
//   // 1. Verify user exists
//   const userExists = await prisma.user.findUnique({
//     where: { id: userId },
//   });
//   if (!userExists) {
//     return { message: "User not found" };
//   }

//   // 2. Fetch word
//   const word = await prisma.word.findUnique({
//     where: { id: wordId },
//   });
//   if (!word) {
//     return { message: "Word not found" };
//   }

//   // 3. Prepare oldData for JSON
//   const wordDataForHistory = {
//     id: word.id,
//     value: word.value,
//     meaning: word.meaning,
//     sentences: word.sentences,
//     pluralForm: word.pluralForm,
//     levelId: word.levelId,
//     topicId: word.topicId,
//     articleId: word.articleId,
//     partOfSpeechId: word.partOfSpeechId,
//     modifiedFields: word.modifiedFields,
//     createdBy: word.createdBy,
//   };

//   // 4. Use transaction
//   try {
//     await prisma.$transaction(async (tx) => {
//       await tx.wordHistory.create({
//         data: {
//           wordId: word.id,
//           userId: userId,
//           modifiedFields: ["DELETED"],
//           oldData: wordDataForHistory,
//           newData: {},
//           modifiedAt: new Date(),
//         },
//       });

//       await tx.word.delete({
//         where: { id: word.id },
//       });
//     });

//     return {
//       message: `Word '${word.value}' deleted successfully.`,
//       deletedWord: word,
//     };
//   } catch (error) {
//     console.error("Error during deleteWordFromDB:", error);
//     return {
//       message: "Failed to delete word",
//       deletedWord: null,
//     };
//   }
// };

export const deleteWordFromDB = async (wordId: number, userId: string) => {
  const userExists = await prisma.user.findUnique({ where: { id: userId } });
  if (!userExists) return { message: "User not found" };

  const word = await prisma.word.findUnique({ where: { id: wordId } });
  if (!word) return { message: "Word not found" };

  const wordDataForHistory = {
    id: word.id,
    value: word.value,
    meaning: word.meaning,
    sentences: word.sentences,
    pluralForm: word.pluralForm,
    levelId: word.levelId,
    topicId: word.topicId,
    articleId: word.articleId,
    partOfSpeechId: word.partOfSpeechId,
    modifiedFields: word.modifiedFields,
    createdBy: word.createdBy,
  };

  try {
    await prisma.$transaction(async (tx) => {
      const history = await tx.wordHistory.create({
        data: {
          wordId: word.id,
          userId,
          modifiedFields: ["DELETED"],
          oldData: wordDataForHistory,
          newData: {},
        },
      });
      // console.log("wordHistory insert result:", history);

      // console.log("Deleting word...");
      const deleted = await tx.word.delete({ where: { id: word.id } });
      // console.log("Deleted word:", deleted);
    });

    return {
      message: `Word '${word.value}' deleted successfully.`,
      deletedWord: word,
    };
  } catch (error) {
    console.error("Transaction error:", error);
    return { message: "Failed to delete word", deletedWord: null };
  }
};

export const deleteAllWordsFromDB = async (): Promise<{ message: string }> => {
  await prisma.word.deleteMany();
  return { message: "All words deleted successfully" };
};

export const wordService = {
  createWord,
  getWordsListFromDB,
  getSingleWordFromDB,
  updateWordInDB,
  deleteWordFromDB,
  deleteAllWordsFromDB,
};

import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

// Endpoint to update Level data
export const updateLevel = async (req: Request, res: Response) => {
  const { id } = req.params;
  const { level } = req.body;
  try {
    const updatedLevel = await prisma.level.update({
      where: { id: parseInt(id, 10) },
      data: { level },
    });
    res.status(200).json({
      message: "Level updated successfully",
      level: updatedLevel,
    });
  } catch (error) {
    res.status(500).json({ error: "Error updating level" });
  }
};

// update topic
export const createTopic = async (req: any, res: any) => {
  const { name } = req.body;
  try {
    const newTopic = await prisma.topic.create({
      data: { name },
    });
    res
      .status(201)
      .json({ message: "Topic added successfully", topic: newTopic });
  } catch (error) {
    res.status(500).json({ error: "Error inserting topic" });
  }
};

// update an article
export const updateArticle = async (req: any, res: any) => {
  const { name } = req.body;
  try {
    const newArticle = await prisma.article.create({
      data: { name },
    });
    res
      .status(201)
      .json({ message: "Article added successfully", article: newArticle });
  } catch (error) {
    res.status(500).json({ error: "Error inserting article" });
  }
};

// update parts of speech
export const upDatePartsOfSpeech = async (req: any, res: any) => {
  const { name } = req.body;
  try {
    const newPartOfSpeech = await prisma.partOfSpeech.create({
      data: { name },
    });
    res.status(201).json({
      message: "Part of speech added successfully",
      partOfSpeech: newPartOfSpeech,
    });
  } catch (error) {
    res.status(500).json({ error: "Error inserting part of speech" });
  }
};

// update a word
// const normalizeCasing = (str: string) => str.toLowerCase().trim();

// ==================================
// this is corrected code also and no need of handle relations function for this
// export const updateWord = async (req: any, res: any) => {
//   try {
//     const {
//       id,
//       value,
//       meaning,
//       sentences,
//       levelId,
//       topicId,
//       articleId,
//       partOfSpeechId,
//       pluralForm,
//       synonyms = [],
//       antonyms = [],
//       similarWords = [],
//     } = req.body;

//     // Log the incoming request data for debugging
//     console.log("Request body:", req.body);

//     // Validate Required Fields
//     if (!id || !value || !meaning) {
//       return res.status(400).json({ error: "Missing required fields" });
//     }

//     // Normalize Input Data
//     const normalizedValue = normalizeCasing(value);
//     const normalizedMeaning = meaning.map(normalizeCasing);

//     // Convert IDs to Integers
//     const parsedIds = {
//       levelId: parseInt(levelId, 10),
//       topicId: parseInt(topicId, 10),
//       articleId: parseInt(articleId, 10),
//       partOfSpeechId: parseInt(partOfSpeechId, 10),
//     };
//     // Fetch the Word IDs for Synonyms, Antonyms, and Similar Words
//     const synonymIds = await Promise.all(
//       synonyms.map(async (synonym: string) => {
//         const word = await prisma.word.findUnique({
//           where: { value: synonym },
//         });
//         return word ? { id: word.id } : null;
//       })
//     );

//     const antonymIds = await Promise.all(
//       antonyms.map(async (antonym: string) => {
//         const word = await prisma.word.findUnique({
//           where: { value: antonym },
//         });
//         return word ? { id: word.id } : null;
//       })
//     );

//     const similarWordIds = await Promise.all(
//       similarWords.map(async (similarWord: string) => {
//         const word = await prisma.word.findUnique({
//           where: { value: similarWord },
//         });
//         return word ? { id: word.id } : null;
//       })
//     );

//     // Update Word Data

//     const updatedWord = await prisma.word.update({
//       where: { id: parseInt(id, 10) },
//       data: {
//         value: normalizedValue,
//         meaning: {
//           set: normalizedMeaning, // This replaces the entire meaning array
//         },
//         sentences,
//         ...parsedIds,
//         pluralForm: pluralForm ? normalizeCasing(pluralForm) : null,
//         synonyms:
//           synonyms.length > 0
//             ? { set: synonymIds.filter(Boolean) }
//             : { set: [] },
//         antonyms:
//           antonyms.length > 0
//             ? { set: antonymIds.filter(Boolean) }
//             : { set: [] },
//         similarWords:
//           similarWords.length > 0
//             ? { set: similarWordIds.filter(Boolean) }
//             : { set: [] },
//       },
//     });

//     // Respond with the updated word
//     res
//       .status(200)
//       .json({ message: "Word updated successfully", word: updatedWord });
//   } catch (error) {
//     console.error("Error updating word:", error);
//     res.status(500).json({ error: "Internal server error" });
//   }
// };
// ==================================

// =============================
// perfect. now look. like example has synonym here sample, antonym samples1 and similar word samples2. when i look for  word "sample" it should automatically binded there the word exapmle  in the synonmy section. as both are synonym. and samples1 should set example and samples1 as its antonmy. and do not consider similar word here.
// =============================
// const handleRelations = async (
//   words: string[],
//   relation: string,
//   newWordId: number,
//   metadata: {
//     levelId: number;
//     topicId: number;
//     articleId: number;
//     partOfSpeechId: number;
//   },
//   removeWords: string[] = []
// ) => {
//   // Handle word additions and removals
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

//     // Connect the relation (add new ones)
//     await prisma.word.update({
//       where: { id: newWordId },
//       data: {
//         [relation]: {
//           connect: { id: wordEntity.id },
//         },
//       },
//     });
//   }

//   // Handle removals (disconnect words)
//   for (const word of removeWords) {
//     const normalizedWord = normalizeCasing(word);
//     const wordEntity = await prisma.word.findUnique({
//       where: { value: normalizedWord },
//     });

//     if (wordEntity) {
//       await prisma.word.update({
//         where: { id: newWordId },
//         data: {
//           [relation]: {
//             disconnect: { id: wordEntity.id },
//           },
//         },
//       });
//     }
//   }
// };

const normalizeCasing = (str: string) => str.toLowerCase().trim();
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
  removeWords: string[] = []
) => {
  // Handle word additions and reciprocal relations
  for (const word of words) {
    const normalizedWord = normalizeCasing(word);
    // Find or create the related word
    const wordEntity = await prisma.word.upsert({
      where: { value: normalizedWord },
      update: {},
      create: {
        value: normalizedWord,
        meaning: [],
        sentences: [],
        ...metadata,
      },
    });

    // Connect the relation (add new ones)
    await prisma.word.update({
      where: { id: newWordId },
      data: {
        [relation]: {
          connect: { id: wordEntity.id },
        },
      },
    });

    // Ensure reciprocal relation exists
    const reverseRelation =
      relation === "synonyms"
        ? "synonyms"
        : relation === "antonyms"
        ? "antonyms"
        : null; // Add logic for other relations if needed

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

  // Handle removals (disconnect words)
  for (const word of removeWords) {
    const normalizedWord = normalizeCasing(word);
    const wordEntity = await prisma.word.findUnique({
      where: { value: normalizedWord },
    });

    if (wordEntity) {
      // Disconnect relation
      await prisma.word.update({
        where: { id: newWordId },
        data: {
          [relation]: {
            disconnect: { id: wordEntity.id },
          },
        },
      });

      // Remove reciprocal relation
      const reverseRelation =
        relation === "synonyms"
          ? "synonyms"
          : relation === "antonyms"
          ? "antonyms"
          : null; // Add logic for other relations if needed

      if (reverseRelation) {
        await prisma.word.update({
          where: { id: wordEntity.id },
          data: {
            [reverseRelation]: {
              disconnect: { id: newWordId },
            },
          },
        });
      }
    }
  }
};

//http://localhost:3000/update-word/1626
// {"id":1645,
//   "value": "eigentlich",
//   "meaning": ["feeling or showing pleasure or contentment"],
//   "sentences": ["She felt happy when she saw her results."],
//   "levelId": "1",
//   "topicId": "1",
//   "articleId": "3",
//   "partOfSpeechId": "1",
//   "pluralForm": "",
//   "synonyms": ["tatsächlich"],
//   "antonyms": [],
//   "similarWords": []
// }
export const updateWord = async (req: any, res: any) => {
  try {
    const {
      // id,
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
    } = req.body;
    const { id } = req.params;
    // Log the incoming request data for debugging
    console.log("Request body:", req.body);

    // Validate Required Fields
    if (!value || !meaning) {
      return res.status(400).json({ error: "Missing required fields" });
    }

    // Normalize Input Data
    const normalizedValue = normalizeCasing(value);
    const normalizedMeaning = meaning.map(normalizeCasing);

    // Convert IDs to Integers
    const parsedIds = {
      levelId: parseInt(levelId, 10),
      topicId: parseInt(topicId, 10),
      articleId: parseInt(articleId, 10),
      partOfSpeechId: parseInt(partOfSpeechId, 10),
    };

    //     // Fetch the Word IDs for Synonyms, Antonyms, and Similar Words
    const synonymIds = await Promise.all(
      synonyms.map(async (synonym: string) => {
        const word = await prisma.word.findUnique({
          where: { value: synonym },
        });
        return word ? { id: word.id } : null;
      })
    );

    const antonymIds = await Promise.all(
      antonyms.map(async (antonym: string) => {
        const word = await prisma.word.findUnique({
          where: { value: antonym },
        });
        return word ? { id: word.id } : null;
      })
    );

    const similarWordIds = await Promise.all(
      similarWords.map(async (similarWord: string) => {
        const word = await prisma.word.findUnique({
          where: { value: similarWord },
        });
        return word ? { id: word.id } : null;
      })
    );

    const updatedWord = await prisma.word.update({
      where: { id: parseInt(id, 10) },
      data: {
        value: normalizedValue,
        meaning: {
          set: normalizedMeaning, // This replaces the entire meaning array
        },
        sentences,
        ...parsedIds,
        pluralForm: pluralForm ? normalizeCasing(pluralForm) : null,
        synonyms:
          synonyms.length > 0
            ? { set: synonymIds.filter(Boolean) }
            : { set: [] },
        antonyms:
          antonyms.length > 0
            ? { set: antonymIds.filter(Boolean) }
            : { set: [] },
        similarWords:
          similarWords.length > 0
            ? { set: similarWordIds.filter(Boolean) }
            : { set: [] },
      },
    });

    // Handle Synonyms, Antonyms, Similar Words
    await handleRelations(synonyms, "synonyms", id, parsedIds);
    await handleRelations(antonyms, "antonyms", id, parsedIds);
    await handleRelations(similarWords, "similarWords", id, parsedIds);

    res
      .status(200)
      .json({ message: "Word updated successfully", word: updatedWord });
  } catch (error) {
    console.error("Error updating word:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

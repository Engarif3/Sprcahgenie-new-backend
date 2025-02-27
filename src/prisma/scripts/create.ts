import { PrismaClient } from "@prisma/client";
import fs from "fs";
import path from "path";

const prisma = new PrismaClient();

const normalizeCasing = (str: string) => str.toLowerCase().trim();
// ==============================

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

// Endpoint to Insert Word Data
export const createWord = async (req: any, res: any) => {
  try {
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
    } = req.body;

    if (!value || !meaning || meaning.length === 0) {
      return res
        .status(400)
        .json({ error: "Missing required fields or empty arrays" });
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

    // Filter out empty or invalid items from synonyms, antonyms, and similarWords
    const filteredSynonyms = synonyms.filter(
      (item: string) => item.trim() !== ""
    );
    const filteredAntonyms = antonyms.filter(
      (item: string) => item.trim() !== ""
    );
    const filteredSimilarWords = similarWords.filter(
      (item: string) => item.trim() !== ""
    );

    // Check if the word already exists
    const existingWord = await prisma.word.findUnique({
      where: { value: normalizedValue },
    });

    if (existingWord) {
      return res.status(409).json({
        error: `The word '${normalizedValue}' already exists.`,
      });
    }
    // Insert Word Data
    const newWord = await prisma.word.create({
      data: {
        value: normalizedValue,
        meaning: normalizedMeaning,
        sentences,
        ...parsedIds,
        pluralForm: pluralForm ? normalizeCasing(pluralForm) : null,
      },
    });

    // Handle Synonyms, Antonyms, Similar Words
    if (filteredSynonyms.length > 0) {
      await handleRelations(
        filteredSynonyms,
        "synonyms",
        newWord.id,
        parsedIds
      );
    }
    if (filteredAntonyms.length > 0) {
      await handleRelations(
        filteredAntonyms,
        "antonyms",
        newWord.id,
        parsedIds
      );
    }
    if (filteredSimilarWords.length > 0) {
      await handleRelations(
        filteredSimilarWords,
        "similarWords",
        newWord.id,
        parsedIds
      );
    }

    res.status(201).json({ message: "Word added successfully", word: newWord });
  } catch (error) {
    console.error("Error inserting word:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

type CreateWordResult =
  | { message: "This word already exists"; word: any }
  | { word: any }; // Adjust `any` to the actual type of your `word` object if known.

export const createWordLogic = async (
  wordData: any
): Promise<CreateWordResult> => {
  try {
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
    } = wordData;

    if (!value || !meaning || meaning.length === 0) {
      throw new Error("Missing required fields or empty arrays");
    }

    // Normalize Input Data
    const normalizedValue = normalizeCasing(value);

    // Check if the word already exists
    const existingWord = await prisma.word.findUnique({
      where: { value: normalizedValue },
    });

    if (existingWord) {
      return { message: "This word already exists", word: existingWord };
    }

    // Convert IDs to Integers
    const parsedIds = {
      levelId: parseInt(levelId, 10),
      topicId: parseInt(topicId, 10),
      articleId: parseInt(articleId, 10),
      partOfSpeechId: parseInt(partOfSpeechId, 10),
    };

    // Insert Word Data
    const newWord = await prisma.word.create({
      data: {
        value: normalizedValue,
        meaning,
        sentences,
        ...parsedIds,
        pluralForm: pluralForm ? normalizeCasing(pluralForm) : null,
      },
    });

    // Handle Synonyms, Antonyms, Similar Words
    if (synonyms.length > 0) {
      await handleRelations(synonyms, "synonyms", newWord.id, parsedIds);
    }
    if (antonyms.length > 0) {
      await handleRelations(antonyms, "antonyms", newWord.id, parsedIds);
    }
    if (similarWords.length > 0) {
      await handleRelations(
        similarWords,
        "similarWords",
        newWord.id,
        parsedIds
      );
    }

    return { word: newWord };
  } catch (error) {
    console.error("Error inserting word:", error);
    throw error;
  }
};

export const importWordsFromJson = async (req: any, res: any) => {
  try {
    const filePath = path.join(__dirname, "../../dataToDb/words.json");
    const data = fs.readFileSync(filePath, "utf8");
    const words = JSON.parse(data);

    for (const word of words) {
      try {
        const result = await createWordLogic(word);

        if (
          "message" in result &&
          result.message === "This word already exists"
        ) {
          console.log(result.message + `: ${result.word.value}`);
        } else {
          console.log("Inserted word:", result.word);
        }
      } catch (error) {
        console.error(`Failed to insert word: ${word.value}`, error);
      }
    }

    res.status(201).json({ message: "Words imported successfully" });
  } catch (error) {
    console.error("Error importing words:", error);
    res.status(500).json({ error: "Failed to import words" });
  }
};

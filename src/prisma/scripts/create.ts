import { PrismaClient } from "@prisma/client";
import fs from "fs";
import path from "path";

const prisma = new PrismaClient();

const normalizeCasing = (str: string) => str.toLowerCase().trim();
// ==============================

const createdBy = "d9a98059-2f81-4cfa-a9a3-04545a677972";

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
  createdBy: string,
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
        createdBy,
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
      createdBy,
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
        createdBy: "d9a98059-2f81-4cfa-a9a3-04545a677972",
      },
    });

    // Handle Synonyms, Antonyms, Similar Words
    if (filteredSynonyms.length > 0) {
      await handleRelations(
        filteredSynonyms,
        "synonyms",
        newWord.id,
        parsedIds,
        createdBy
      );
    }
    if (filteredAntonyms.length > 0) {
      await handleRelations(
        filteredAntonyms,
        "antonyms",
        newWord.id,
        parsedIds,
        createdBy
      );
    }
    if (filteredSimilarWords.length > 0) {
      await handleRelations(
        filteredSimilarWords,
        "similarWords",
        newWord.id,
        parsedIds,
        createdBy
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
  wordData: any,
  updateIfExists: boolean = true
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

    const normalizedValue = normalizeCasing(value);

    const existingWord = await prisma.word.findUnique({
      where: { value: normalizedValue },
    });

    if (existingWord) {
      if (updateIfExists) {
        const updatedWord = await prisma.word.update({
          where: { value: normalizedValue },
          data: {
            sentences: sentences?.length ? sentences : existingWord.sentences,
            pluralForm: pluralForm || existingWord.pluralForm,
            // add more fields to update if needed
          },
        });
        return { message: "This word already exists", word: updatedWord };
      } else {
        return { message: "This word already exists", word: existingWord };
      }
    }

    const parsedIds = {
      levelId: parseInt(levelId, 10),
      topicId: parseInt(topicId, 10),
      articleId: parseInt(articleId, 10),
      partOfSpeechId: parseInt(partOfSpeechId, 10),
    };

    const newWord = await prisma.word.create({
      data: {
        value: normalizedValue,
        meaning,
        sentences,
        ...parsedIds,
        pluralForm: pluralForm ? normalizeCasing(pluralForm) : null,
        createdBy,
      },
    });

    if (synonyms.length > 0) {
      await handleRelations(
        synonyms,
        "synonyms",
        newWord.id,
        parsedIds,
        createdBy
      );
    }
    if (antonyms.length > 0) {
      await handleRelations(
        antonyms,
        "antonyms",
        newWord.id,
        parsedIds,
        createdBy
      );
    }
    if (similarWords.length > 0) {
      await handleRelations(
        similarWords,
        "similarWords",
        newWord.id,
        parsedIds,
        createdBy
      );
    }

    return { word: newWord };
  } catch (error) {
    console.error("Error inserting or updating word:", error);
    throw error;
  }
};

// export const importWordsFromJson = async (req: any, res: any) => {
//   try {
//     // 1. Truncate the table and reset the ID
//     await prisma.$executeRawUnsafe(
//       `TRUNCATE TABLE "words_table" RESTART IDENTITY CASCADE;`
//     );
//     console.log("Word table truncated and IDs reset.");

//     const filePath = path.join(__dirname, "../../dataToDb/words.json");
//     const data = fs.readFileSync(filePath, "utf8");
//     const words = JSON.parse(data);

//     for (const word of words) {
//       try {
//         // const result = await createWordLogic(word);
//         const result = await createWordLogic(word, true); // second param enables update

//         if (
//           "message" in result &&
//           result.message === "This word already exists"
//         ) {
//           console.log(result.message + `: ${result.word.value}`);
//         } else {
//           console.log("Inserted word:", result.word);
//         }
//       } catch (error) {
//         console.error(`Failed to insert word: ${word.value}`, error);
//       }
//     }

//     res.status(201).json({ message: "Words imported successfully" });
//   } catch (error) {
//     console.error("Error importing words:", error);
//     res.status(500).json({ error: "Failed to import words" });
//   }
// };
export const importWordsFromJson = async (req: any, res: any) => {
  try {
    //for starting id from 1 ..remember it will words again and again if try again
    // await prisma.$executeRawUnsafe(
    //   `TRUNCATE TABLE "words_table" RESTART IDENTITY CASCADE;`
    // );
    // console.log("Word table truncated and IDs reset.");

    const filePath = path.join(__dirname, "../../dataToDb/words.json");
    const data = fs.readFileSync(filePath, "utf8");
    const words = JSON.parse(data);

    console.log(`Starting to insert ${words.length} words...`);
    const start = Date.now();

    for (const word of words) {
      try {
        const result = await createWordLogic(word, true);

        if (
          "message" in result &&
          result.message === "This word already exists"
        ) {
          console.log(result.message + `: ${result.word.value}`);
        } else {
          console.log("Inserted word:", result.word.value);
        }
      } catch (error) {
        console.error(`Failed to insert word: ${word.value}`, error);
      }
    }

    const end = Date.now();
    console.log(`✅ All words processed in ${(end - start) / 1000}s`);

    res.status(201).json({ message: "Words imported successfully" });
  } catch (error) {
    console.error("Error importing words:", error);
    res.status(500).json({ error: "Failed to import words" });
  }
};

export const importTopicsWithLevels = async (req: any, res: any) => {
  try {
    // 1. Ensure required levels exist
    const levelsToUpsert = [
      { id: 1, level: "A1" },
      { id: 2, level: "A2" },
      { id: 3, level: "B1" },
      { id: 4, level: "B2" },
      { id: 6, level: "Unknown" },
    ];

    for (const level of levelsToUpsert) {
      await prisma.level.upsert({
        where: { id: level.id },
        update: { level: level.level },
        create: level,
      });
    }
    console.log("Levels verification completed");

    // 2. Create required articles
    const articlesToUpsert = [
      { id: 1, name: "der" },
      { id: 2, name: "die" },
      { id: 3, name: "das" },
      { id: 4, name: "" },
      { id: 5, name: "der/die" },
    ];

    let articlesCreated = 0;
    let articlesSkipped = 0;

    for (const article of articlesToUpsert) {
      try {
        const existingArticle = await prisma.article.findUnique({
          where: { id: article.id },
        });

        if (existingArticle) {
          console.log(`Article exists: ${article.name} (ID: ${article.id})`);
          articlesSkipped++;
          continue;
        }

        await prisma.article.create({
          data: {
            id: article.id,
            name: article.name,
          },
        });
        console.log(`Created article: ${article.name} (ID: ${article.id})`);
        articlesCreated++;
      } catch (error) {
        console.error(`Failed to process article: ${article.name}`, error);
      }
    }

    // 3. Import topics
    const filePath = path.join(__dirname, "../../dataToDb/topics.json");
    const data = fs.readFileSync(filePath, "utf8");
    const topics = JSON.parse(data);

    let topicsCreated = 0;
    let topicsSkipped = 0;

    for (const topic of topics) {
      try {
        const existingTopic = await prisma.topic.findUnique({
          where: { id: topic.id },
        });

        if (existingTopic) {
          console.log(`Topic exists: ${topic.name} (ID: ${topic.id})`);
          topicsSkipped++;
          continue;
        }

        await prisma.topic.create({
          data: {
            id: topic.id,
            name: topic.name,
            levelId: topic.levelId,
          },
        });
        console.log(`Created topic: ${topic.name} (ID: ${topic.id})`);
        topicsCreated++;
      } catch (error) {
        console.error(`Failed to process topic: ${topic.name}`, error);
      }
    }

    // 4. Reset sequences
    await prisma.$executeRaw`SELECT setval('topics_id_seq', (SELECT MAX(id) FROM topics));`;
    await prisma.$executeRaw`SELECT setval('articles_id_seq', (SELECT MAX(id) FROM articles));`;

    res.status(201).json({
      message: "Full import completed",
      results: {
        levels: levelsToUpsert.length,
        articles: {
          created: articlesCreated,
          skipped: articlesSkipped,
          total: articlesToUpsert.length,
        },
        topics: {
          created: topicsCreated,
          skipped: topicsSkipped,
          total: topics.length,
        },
      },
    });
  } catch (error) {
    console.error("Import failed:", error);
    res.status(500).json({
      error: "Import failed",
      details: error instanceof Error ? error.message : "Unknown error",
    });
  } finally {
    await prisma.$disconnect();
  }
};

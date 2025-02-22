const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

// get levels
export const getLevels = async (req: any, res: any) => {
  try {
    const levels = await prisma.level.findMany({
      where: {
        deletedAt: null, // Only fetch levels that are not soft-deleted
      },
    }); // Fetch all levels from the database
    res.status(200).json(levels); // Respond with the fetched levels
  } catch (error) {
    console.error("Error fetching levels:", error);
    res.status(500).json({ error: "Error fetching levels" });
  }
};

// get topics
// get topics
export const getTopics = async (req: any, res: any) => {
  try {
    const topics = await prisma.topic.findMany({
      orderBy: {
        id: "asc", // Sort topics by topicId in ascending order
      },
    });
    res.status(200).json(topics);
  } catch (error) {
    console.error("Error fetching topics:", error);
    res.status(500).json({ error: "Error fetching topics" });
  }
};

// get articles
export const getArticles = async (req: any, res: any) => {
  try {
    const articles = await prisma.article.findMany(); // Fetch all articles from the database
    res.status(200).json(articles); // Respond with the fetched articles
  } catch (error) {
    console.error("Error fetching articles:", error);
    res.status(500).json({ error: "Error fetching articles" });
  }
};

// get parts of speech
export const getPartsOfSpeech = async (req: any, res: any) => {
  try {
    const partsOfSpeech = await prisma.partOfSpeech.findMany(); // Fetch all parts of speech from the database
    res.status(200).json(partsOfSpeech); // Respond with the fetched parts of speech
  } catch (error) {
    console.error("Error fetching parts of speech:", error);
    res.status(500).json({ error: "Error fetching parts of speech" });
  }
};

// get word list with pagination
// http://localhost:000/words?page=1&limit=40&level=B1&topic=So war das damals …

// export const getWordsList = async (req: any, res: any) => {
//   try {
//     const showAll = req.query.all === "true";
//     const page = req.query.page ? parseInt(req.query.page) : 1;
//     const limit = req.query.limit ? parseInt(req.query.limit) : 50;
//     const level = req.query.level || "";
//     const topic = req.query.topic || "";

//     const skip = (page - 1) * limit;
//     const take = limit;

//     const whereConditions: any = {};
//     if (level) {
//       const levelRecord = await prisma.level.findUnique({
//         where: { level },
//       });
//       if (levelRecord) whereConditions.levelId = levelRecord.id;
//     }
//     if (topic) {
//       const topicRecord = await prisma.topic.findUnique({
//         where: { name: topic },
//       });
//       if (topicRecord) whereConditions.topicId = topicRecord.id;
//     }

//     const words = await prisma.word.findMany({
//       where: whereConditions,
//       skip: showAll ? undefined : skip,
//       take: showAll ? undefined : take,
//       include: {
//         level: true,
//         topic: true,
//         article: true,
//         partOfSpeech: true,
//         synonyms: true,
//         antonyms: true,
//         similarWords: true,
//       },
//       orderBy: {
//         value: "asc",
//       },
//     });

//     const totalWords = await prisma.word.count({ where: whereConditions });
//     res.status(200).json({
//       words,
//       currentPage: showAll ? null : page,
//       totalPages: showAll ? null : Math.ceil(totalWords / limit),
//       totalWords,
//       levels: await prisma.level.findMany({ distinct: ["level"] }),
//       topics: await prisma.topic.findMany({ distinct: ["name"] }),
//     });
//   } catch (error) {
//     console.error("Error fetching words:", error);
//     res.status(500).json({ error: "Error fetching words" });
//   }
// };
export const getWordsList = async (req: any, res: any) => {
  try {
    const showAll = req.query.all === "true";
    const page = req.query.page ? parseInt(req.query.page) : 1;
    const limit = req.query.limit ? parseInt(req.query.limit) : 50;
    const level = req.query.level || "";
    const topic = req.query.topic || "";

    const skip = (page - 1) * limit;
    const take = limit;

    const whereConditions: any = {};
    let filteredTopics: any[] = [];

    if (level) {
      const levelRecord = await prisma.level.findUnique({
        where: { level },
      });
      if (levelRecord) {
        whereConditions.levelId = levelRecord.id;
        // Filter topics based on the selected level
        filteredTopics = await prisma.topic.findMany({
          where: {
            words: {
              some: {
                levelId: levelRecord.id,
              },
            },
          },
        });
      }
    }

    if (topic) {
      const topicRecord = await prisma.topic.findUnique({
        where: { name: topic },
      });
      if (topicRecord) whereConditions.topicId = topicRecord.id;
    }

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
      },
      orderBy: {
        value: "asc",
      },
    });

    const totalWords = await prisma.word.count({ where: whereConditions });

    res.status(200).json({
      words,
      currentPage: showAll ? null : page,
      totalPages: showAll ? null : Math.ceil(totalWords / limit),
      totalWords,
      levels: await prisma.level.findMany({ distinct: ["level"] }),
      topics: level
        ? filteredTopics
        : await prisma.topic.findMany({ distinct: ["name"] }),
    });
  } catch (error) {
    console.error("Error fetching words:", error);
    res.status(500).json({ error: "Error fetching words" });
  }
};

// Suggest words based on search query
// http://localhost:3000/suggest/fordern
// export const suggestWords = async (req: any, res: any) => {
//   try {
//     const { query } = req.params;
//     if (!query || query.length < 3) {
//       return res
//         .status(400)
//         .json({ error: "Query must have at least 3 characters." });
//     }

//     const suggestions = await prisma.word.findMany({
//       where: {
//         value: {
//           contains: query, // Perform partial matching
//           mode: "insensitive", // Case-insensitive matching
//         },
//       },
//       select: { value: true }, // Fetch only the word values
//       take: 10, // Limit the number of suggestions
//     });

//     res.status(200).json(suggestions);
//   } catch (error) {
//     console.error("Error fetching suggestions:", error);
//     res.status(500).json({ error: "Error fetching suggestions" });
//   }
// };
// Suggest words based on search query
export const suggestWords = async (req: any, res: any) => {
  try {
    const { query } = req.params;
    if (!query || query.length < 3) {
      return res
        .status(400)
        .json({ error: "Query must have at least 3 characters." });
    }

    const suggestions = await prisma.word.findMany({
      where: {
        value: {
          contains: query, // Perform partial matching
          mode: "insensitive", // Case-insensitive matching
        },
      },
      include: {
        level: true, // Include level information
        topic: true, // Include topic information
        article: true, // Include article information
        partOfSpeech: true, // Include part of speech information
        synonyms: true, // Include synonyms
        antonyms: true, // Include antonyms
        similarWords: true, // Include similar words
      },
      take: 10, // Limit the number of suggestions
    });

    res.status(200).json(suggestions);
  } catch (error) {
    console.error("Error fetching suggestions:", error);
    res.status(500).json({ error: "Error fetching suggestions" });
  }
};

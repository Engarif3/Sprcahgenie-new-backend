import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// Add a word to the user's favorite list

export const addFavoriteWord = async (req: Request, res: Response) => {
  try {
    const { userId, wordId } = req.body;

    // ✅ Validate input
    if (!userId || !wordId) {
      return res
        .status(400)
        .json({ error: "User ID and Word ID are required" });
    }

    // ✅ Check if user exists
    const userExists = await prisma.user.findUnique({
      where: { id: userId },
    });
    if (!userExists) {
      return res.status(404).json({ error: "User not found" });
    }

    // ✅ Check if word exists
    const wordExists = await prisma.word.findUnique({
      where: { id: wordId },
    });
    if (!wordExists) {
      return res.status(404).json({ error: "Word not found" });
    }

    // ✅ Check if word is already in favorites
    const existingFavorite = await prisma.favoriteWord.findFirst({
      where: { userId, wordId },
    });

    if (existingFavorite) {
      return res.status(400).json({ error: "Word is already in favorites" });
    }

    // ✅ Add favorite word
    const favoriteWord = await prisma.favoriteWord.create({
      data: { userId, wordId },
    });

    // ✅ Respond with the created favorite word
    return res.status(201).json({
      success: true,
      message: "Word added to favorites successfully",
      data: favoriteWord,
    });
  } catch (error: any) {
    console.error(error); // Log error for debugging
    return res.status(500).json({ error: "Internal server error" });
  }
};

//Remove a word from the user's favorite list

export const removeFavoriteWord = async (req: Request, res: Response) => {
  try {
    const { userId } = req.body;
    const { wordId } = req.params;

    // ✅ Validate input
    if (!userId || !wordId) {
      return res
        .status(400)
        .json({ error: "User ID and Word ID are required" });
    }

    // ✅ Check if the favorite word exists
    const favoriteWord = await prisma.favoriteWord.deleteMany({
      where: {
        userId,
        wordId: parseInt(wordId), // Ensure wordId is a number
      },
    });

    if (favoriteWord.count === 0) {
      return res.status(404).json({ error: "Favorite word not found" });
    }

    // ✅ Respond with a successful deletion message
    return res.status(200).json({
      success: true,
      message: "Favorite word removed successfully",
    });
  } catch (error: any) {
    console.error(error); // Log error for debugging
    return res.status(500).json({ error: "Internal server error" });
  }
};

// Get all favorite words of a user

// export const getFavoriteWords = async (req: Request, res: Response) => {
//   try {
//     const { userId } = req.params;

//     // ✅ Validate input
//     if (!userId) {
//       return res.status(400).json({ error: "User ID is required" });
//     }

//     // ✅ Fetch favorite words for the user
//     const favoriteWords = await prisma.favoriteWord.findMany({
//       where: { userId },
//       include: {
//         word: true, // Include word details
//       },
//     });

//     if (favoriteWords.length === 0) {
//       return res
//         .status(404)
//         .json({ error: "No favorite words found for this user" });
//     }

//     // ✅ Respond with the list of favorite words
//     const words = favoriteWords.map((fav) => fav.word);
//     return res.status(200).json({
//       success: true,
//       message: "Favorite words retrieved successfully",
//       data: words, // Sending the list of words
//     });
//   } catch (error: any) {
//     console.error(error); // Log error for debugging
//     return res.status(500).json({ error: "Internal server error" });
//   }
// };
export const getFavoriteWords = async (req: Request, res: Response) => {
  try {
    const { userId } = req.params;

    if (!userId) {
      return res.status(400).json({ error: "User ID is required" });
    }

    const favoriteWords = await prisma.favoriteWord.findMany({
      where: { userId: userId },
      include: {
        word: {
          include: {
            level: true, // Include the level relation
            topic: true, // Include topic if needed
            article: true, // Include article if needed
            synonyms: true,
            antonyms: true,
            similarWords: true,
          },
        },
      },
    });

    // if (favoriteWords.length === 0) {
    //   return res
    //     .status(404)
    //     .json({ error: "No favorite words found for this user" });
    // }

    // Instead of 404, return 200 with an empty array if no favorite words are found
    if (favoriteWords.length === 0) {
      return res.status(200).json({
        success: true,
        message: "No favorite words found for this user",
        data: [],
      });
    }

    // Map the response to match your WordList structure
    const words = favoriteWords.map((fav) => ({
      ...fav.word,
      level: fav.word.level,
      topic: fav.word.topic,
      article: fav.word.article,
      synonyms: fav.word.synonyms,
      antonyms: fav.word.antonyms,
      similarWords: fav.word.similarWords,
    }));

    return res.status(200).json({
      success: true,
      message: "Favorite words retrieved successfully",
      data: words,
    });
  } catch (error: any) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

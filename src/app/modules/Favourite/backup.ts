import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
export const getFavoriteWords = async (req: Request, res: Response) => {
  try {
    const { userId } = req.params;

    if (!userId) {
      return res.status(400).json({ error: "User ID is required" });
    }

    // const favoriteWords = await prisma.favoriteWord.findMany({
    //   where: { userId: userId },
    //   include: {
    //     word: {
    //       include: {
    //         level: true, // Include the level relation
    //         topic: true, // Include topic if needed
    //         article: true, // Include article if needed
    //         synonyms: true,
    //         antonyms: true,
    //         similarWords: true,
    //       },
    //     },
    //   },
    // });

    // // if (favoriteWords.length === 0) {
    // //   return res
    // //     .status(404)
    // //     .json({ error: "No favorite words found for this user" });
    // // }

    // // Instead of 404, return 200 with an empty array if no favorite words are found
    // if (favoriteWords.length === 0) {
    //   return res.status(200).json({
    //     success: true,
    //     message: "No favorite words found for this user",
    //     data: [],
    //   });
    // }

    // // Map the response to match your WordList structure
    // const words = favoriteWords.map((fav) => ({
    //   ...fav.word,
    //   level: fav.word.level,
    //   topic: fav.word.topic,
    //   article: fav.word.article,
    //   synonyms: fav.word.synonyms,
    //   antonyms: fav.word.antonyms,
    //   similarWords: fav.word.similarWords,
    // }));

    // return res.status(200).json({
    //   success: true,
    //   message: "Favorite words retrieved successfully",
    //   data: words,
    // });
    const favoriteWords = await prisma.favoriteWord.findMany({
      where: { userId: userId },
      include: {
        word: {
          include: {
            level: true,
            topic: true,
            article: true,
            synonyms: true,
            antonyms: true,
          },
        },
      },
    });

    // Then fetch similar words separately
    const wordsWithSimilar = await Promise.all(
      favoriteWords.map(async (fav) => {
        const similarWords = await prisma.word.findMany({
          where: {
            similarTo: {
              some: {
                id: fav.word.id,
              },
            },
          },
          include: {
            level: true,
            topic: true,
            article: true,
          },
        });

        return {
          ...fav.word,
          level: fav.word.level,
          topic: fav.word.topic,
          article: fav.word.article,
          synonyms: fav.word.synonyms,
          antonyms: fav.word.antonyms,
          similarWords: similarWords.filter((sw) => sw.id !== fav.word.id),
        };
      })
    );

    return res.status(200).json({
      success: true,
      message: "Favorite words retrieved successfully",
      data: wordsWithSimilar,
    });
  } catch (error: any) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

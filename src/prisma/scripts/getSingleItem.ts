// Endpoint to fetch a single Word by ID or Value
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getSingleWord = async (req: any, res: any) => {
  const { idOrValue } = req.params;

  try {
    // Determine if idOrValue is a number (ID) or a string (Value)
    const isId = !isNaN(Number(idOrValue));
    const word = await prisma.word.findFirst({
      where: isId
        ? { id: Number(idOrValue) } // Search by ID
        : { value: idOrValue.toLowerCase().trim() }, // Search by Value
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

    if (!word) {
      return res.status(404).json({ error: "Word not found" });
    }

    res.status(200).json(word); // Respond with the fetched word
  } catch (error) {
    console.error("Error fetching word:", error);
    res.status(500).json({ error: "Error fetching word" });
  }
};

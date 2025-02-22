import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

// Endpoint to update Level data
// Endpoint to delete Level data
// delete.ts
export const deleteLevel = async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    const updatedLevel = await prisma.level.update({
      where: { id: parseInt(id, 10) },
      data: { deletedAt: new Date() }, // Soft delete by setting deletedAt
    });
    res.status(200).json({
      message: "Level soft deleted successfully",
      level: updatedLevel,
    });
  } catch (error) {
    console.error("Error soft deleting level", error);
    res.status(500).json({ error: "Error soft deleting level" });
  }
};

// delete a word
export const deleteWord = async (req: any, res: any) => {
  try {
    const { wordId } = req.params; // Get wordId from request parameters

    // Validate that wordId is provided
    if (!wordId) {
      return res.status(400).json({ error: "Word ID is required" });
    }

    // Convert wordId to an integer
    const parsedWordId = parseInt(wordId, 10);

    if (isNaN(parsedWordId)) {
      return res.status(400).json({ error: "Invalid word ID" });
    }

    // Delete the word from the database
    const deletedWord = await prisma.word.delete({
      where: {
        id: parsedWordId,
      },
    });

    // If the word is not found, return an error message
    if (!deletedWord) {
      return res.status(404).json({ error: "Word not found" });
    }

    // Send a success response
    res
      .status(200)
      .json({ message: "Word deleted successfully", word: deletedWord });
  } catch (error) {
    console.error("Error deleting word:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

//delete the whole word list
// Endpoint to delete all words
export const deleteAllWords = async (req: Request, res: Response) => {
  try {
    // Delete all words from the database
    await prisma.word.deleteMany();

    res.status(200).json({ message: "All words deleted successfully" });
  } catch (error) {
    console.error("Error deleting all words:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

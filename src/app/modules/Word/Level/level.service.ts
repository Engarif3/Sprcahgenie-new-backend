import { Request } from "express";

import { Level } from "@prisma/client";
import prisma from "../../../../shared/prisma";

// Create a new Level
const createLevel = async (
  req: Request
): Promise<Level | { message: string }> => {
  const { levelName } = req.body;

  if (!levelName || !levelName.trim()) {
    return { message: "Level name is required" };
  }

  // Check if the level already exists and is soft-deleted
  const existingLevel = await prisma.level.findFirst({
    where: {
      level: levelName,
      deletedAt: {
        not: null, // Check if it's soft-deleted
      },
    },
  });

  if (existingLevel) {
    // Restore the soft-deleted level
    const restoredLevel = await prisma.level.update({
      where: { id: existingLevel.id },
      data: { deletedAt: null }, // Restore by setting deletedAt to null
    });
    return restoredLevel;
  }

  // If the level does not exist, create a new level
  const newLevel = await prisma.level.create({
    data: {
      level: levelName,
      deletedAt: null, // Make sure deletedAt is null for new records
    },
  });

  return newLevel;
};

// Get all Levels
const getAllLevelsFromDB = async (): Promise<Level[]> => {
  const levels = await prisma.level.findMany({
    where: {
      deletedAt: null, // Only fetch levels that are not soft-deleted
    },
  });
  return levels;
};

// Get Level by ID
const getLevelFromDB = async (levelId: number): Promise<Level | null> => {
  const level = await prisma.level.findUnique({
    where: { id: levelId },
  });
  return level;
};

// Update Level
const updateLevel = async (
  levelId: number,
  levelName: string
): Promise<Level | { message: string }> => {
  if (!levelId || !levelName) {
    return { message: "Level ID and Level Name are required" };
  }

  const existingLevel = await prisma.level.findUnique({
    where: { id: levelId },
  });

  if (!existingLevel) {
    return { message: "Level not found" };
  }

  const updatedLevel = await prisma.level.update({
    where: { id: levelId },
    data: { level: levelName },
  });

  return updatedLevel;
};

// Delete Level (soft delete)
const deleteLevel = async (levelId: number): Promise<{ message: string }> => {
  if (!levelId) {
    return { message: "Level ID is required" };
  }

  const existingLevel = await prisma.level.findUnique({
    where: { id: levelId },
  });

  if (!existingLevel) {
    return { message: "Level not found" };
  }

  // Perform soft delete
  await prisma.level.update({
    where: { id: levelId },
    data: { deletedAt: new Date() },
  });

  return { message: "Level soft deleted successfully!" };
};

export const levelService = {
  createLevel,
  getAllLevelsFromDB,
  getLevelFromDB,
  updateLevel,
  deleteLevel,
};

import { Request } from "express";
import { PrefixType } from "@prisma/client";
import prisma from "../../../shared/prisma";
import { Prefix } from "@prisma/client";

// Create a new PrefixType
const createPrefixType = async (
  req: Request
): Promise<PrefixType | { message: string }> => {
  const { name } = req.body;

  if (!name) {
    return { message: "PrefixType name is required" };
  }

  const prefixType = await prisma.prefixType.create({
    data: {
      name,
    },
  });

  return prefixType;
};

// Get all PrefixTypes
const getAllPrefixTypesFromDB = async (): Promise<PrefixType[]> => {
  const prefixTypes = await prisma.prefixType.findMany();
  return prefixTypes;
};

// Get PrefixType by ID
const getPrefixTypeFromDB = async (
  prefixTypeId: number
): Promise<PrefixType | null> => {
  const prefixType = await prisma.prefixType.findUnique({
    where: { id: prefixTypeId },
    include: { prefixes: true },
  });
  return prefixType;
};

const deletePrefixType = async (
  prefixTypeId: number
): Promise<{ message: string }> => {
  // Validate ID
  if (!prefixTypeId) {
    return { message: "PrefixType ID is required" };
  }

  // Check if the PrefixType exists
  const existingPrefixType = await prisma.prefixType.findUnique({
    where: { id: prefixTypeId },
    include: { prefixes: true }, // Fetch related prefixes
  });

  if (!existingPrefixType) {
    return { message: "PrefixType not found" };
  }

  // Delete all related Prefixes first to avoid constraint issues
  await prisma.prefix.deleteMany({
    where: { prefixTypeId },
  });

  // Now delete the PrefixType
  await prisma.prefixType.delete({
    where: { id: prefixTypeId },
  });

  return { message: "PrefixType deleted successfully!" };
};

// ===================================================

const createPrefix = async (
  req: Request
): Promise<Prefix | { message: string }> => {
  const { prefixName, prefixWord, verb, meaning, sentences, prefixTypeId } =
    req.body;

  // Check for missing required fields
  // if (!prefixName || !prefixWord || !meaning || !prefixTypeId) {
  //   return { message: "Prefix fields are required" };
  // }
  if (
    !prefixName ||
    !prefixWord ||
    verb === undefined ||
    !meaning ||
    !prefixTypeId
  ) {
    return { message: "All prefix fields, including 'verb', are required" };
  }

  // Check if the prefixWord already exists (case-insensitive)
  const existingPrefix = await prisma.prefix.findFirst({
    where: {
      prefixWord: {
        equals: prefixWord,
        mode: "insensitive", // Case-insensitive check
      },
    },
  });

  if (existingPrefix) {
    return {
      message: "This prefixWord already exists. Please choose a unique one.",
    };
  }

  // Create the new prefix entry in the database
  const prefix = await prisma.prefix.create({
    data: {
      prefixName,
      prefixWord,
      verb,
      meaning,
      sentences,
      prefixTypeId,
    },
  });

  return prefix;
};

const getAllPrefixesFromDB = async (): Promise<Prefix[]> => {
  const prefixes = await prisma.prefix.findMany({
    include: { prefixType: true },
  });

  // Sort the data
  prefixes.sort((a, b) => {
    // Sort by prefixType name
    const typeCompare = a.prefixType.name.localeCompare(b.prefixType.name);
    if (typeCompare !== 0) return typeCompare;

    // Sort by prefixName
    const nameCompare = a.prefixName.localeCompare(b.prefixName);
    if (nameCompare !== 0) return nameCompare;

    // Sort by prefixWord
    return a.prefixWord.localeCompare(b.prefixWord);
  });

  return prefixes;
};

// Get Prefix by ID
const getPrefixFromDB = async (prefixId: number): Promise<Prefix | null> => {
  const prefix = await prisma.prefix.findUnique({
    where: { id: prefixId },
    include: { prefixType: true },
  });
  return prefix;
};

const updatePrefix = async (
  req: Request
): Promise<Prefix | { message: string }> => {
  const { prefixId } = req.params; // Get prefixId from request params
  const { prefixName, prefixWord, verb, meaning, sentences, prefixTypeId } =
    req.body;

  const parsedPrefixId = parseInt(prefixId, 10);
  if (isNaN(parsedPrefixId)) {
    return { message: "Invalid Prefix ID" };
  }

  // Check if the prefix exists
  const existingPrefix = await prisma.prefix.findUnique({
    where: { id: parsedPrefixId },
  });
  if (!existingPrefix) {
    return { message: "Prefix not found" };
  }

  // Update prefix data
  const updatedPrefix = await prisma.prefix.update({
    where: { id: parsedPrefixId },
    data: {
      prefixName,
      prefixWord,
      verb,
      meaning,
      sentences,
      prefixTypeId,
    },
  });

  return updatedPrefix;
};

const deletePrefix = async (prefixId: number): Promise<{ message: string }> => {
  // Validate ID
  if (!prefixId) {
    return { message: "Prefix ID is required" };
  }

  // Check if the prefix exists
  const existingPrefix = await prisma.prefix.findUnique({
    where: { id: prefixId },
  });
  if (!existingPrefix) {
    return { message: "Prefix not found" };
  }

  // Delete the prefix
  await prisma.prefix.delete({ where: { id: prefixId } });

  return { message: "Prefix deleted successfully!" };
};

export const prefixService = {
  createPrefixType,
  getAllPrefixTypesFromDB,
  getPrefixTypeFromDB,
  createPrefix,
  deletePrefixType,
  getAllPrefixesFromDB,
  getPrefixFromDB,
  updatePrefix,
  deletePrefix,
};

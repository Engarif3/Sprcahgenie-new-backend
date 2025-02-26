import fs from "fs";
import path from "path";
import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const insertPrefixesFromJson = async (req: Request, res: Response) => {
  try {
    // Define the file path
    const filePath = path.join(__dirname, "../dataToDb/prefixes.json");

    // Read the JSON file
    const data = fs.readFileSync(filePath, "utf8");

    // Parse the JSON content
    const jsonData = JSON.parse(data);

    // Validate if it's an array
    if (!Array.isArray(jsonData)) {
      return res.status(400).json({ error: "The JSON data must be an array." });
    }

    // Insert each prefix into the database
    for (const prefix of jsonData) {
      const { prefixName, prefixWord, verb, meaning, sentences, prefixTypeId } =
        prefix;

      if (
        !prefixName ||
        !prefixWord ||
        verb === undefined ||
        !meaning ||
        !prefixTypeId
      ) {
        continue; // Skip invalid entries
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

      if (!existingPrefix) {
        // Insert new prefix
        await prisma.prefix.create({
          data: {
            prefixName,
            prefixWord,
            verb,
            meaning,
            sentences,
            prefixTypeId,
          },
        });
      }
    }

    res.status(201).json({ message: "Prefixes inserted successfully!" });
  } catch (error) {
    console.error("Error inserting prefixes:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

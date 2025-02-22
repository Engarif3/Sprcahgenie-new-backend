import fs from "fs";
import path from "path";
import { Request, Response } from "express";

// insert json data to db
// kept inside create.ts
// count json entries
export const countJsonEntries = (req: any, res: any) => {
  try {
    // Define the file path
    const filePath = path.join(__dirname, "../dataToDb/words.json");

    // Read the JSON file
    const data = fs.readFileSync(filePath, "utf8");

    // Parse the JSON content
    const jsonData = JSON.parse(data);

    // Count the number of entries if it's an array
    if (Array.isArray(jsonData)) {
      // Send the count as the response
      res
        .status(200)
        .json({ message: "Number of entries", count: jsonData.length });
    } else {
      // If the data is not an array, return an error message
      res.status(400).json({ error: "The JSON is not an array." });
    }
  } catch (error) {
    // Handle errors (e.g., file read errors or JSON parsing errors)
    console.error("Error reading or parsing the file:", error);
    res.status(500).json({ error: "Error reading or parsing the file" });
  }
};

// ========================================================================================================================================
// ========================================================================================================================================

// check duplicate word value entry.
export const checkDuplicates = (req: any, res: any) => {
  try {
    // Define the file path
    const filePath = path.join(__dirname, "../dataToDb/words.json");

    // Read the JSON file
    const data = fs.readFileSync(filePath, "utf8");

    // Parse the JSON content
    const jsonData = JSON.parse(data);

    // Count the number of entries if it's an array
    if (Array.isArray(jsonData)) {
      // Count the number of entries
      const count = jsonData.length;

      // Find duplicate values
      const valueCount = jsonData.reduce((acc, word) => {
        acc[word.value] = (acc[word.value] || 0) + 1;
        return acc;
      }, {});

      const duplicates = Object.keys(valueCount).filter(
        (key) => valueCount[key] > 1
      );

      // Send the result as the response
      res.status(200).json({
        message: "Entries count and duplicate check",
        count: count,
        duplicates: duplicates.length > 0 ? duplicates : "No duplicates found",
      });
    } else {
      // If the data is not an array, return an error message
      res.status(400).json({ error: "The JSON is not an array." });
    }
  } catch (error) {
    // Handle errors (e.g., file read errors or JSON parsing errors)
    console.error("Error reading or parsing the file:", error);
    res.status(500).json({ error: "Error reading or parsing the file" });
  }
};

// ========================================================================================================================================
// ========================================================================================================================================

// check json entry data format validity

// Define the structure of a word entry with string IDs
interface WordEntry {
  value: string;
  meaning: string[];
  articleId: string; // Changed to string
  pluralForm: string;
  levelId: string; // Changed to string
  topicId: string; // Changed to string
}

// Type for valid fields
type ValidField = keyof WordEntry;

export const validateFields = (req: Request, res: Response): void => {
  try {
    // Define the file path
    const filePath = path.join(__dirname, "../dataToDb/words.json");

    // Read the JSON file
    const data = fs.readFileSync(filePath, "utf8");

    // Parse the JSON content
    const jsonData: WordEntry[] = JSON.parse(data);

    // Initialize result variables
    const invalidEntries: { index: number; invalidFields: string[] }[] = [];
    const validEntriesCount = jsonData.length;

    // Define expected field types
    const expectedFieldTypes = {
      value: "string",
      meaning: "object", // Array of strings
      articleId: "string", // Changed to string
      pluralForm: "string",
      levelId: "string", // Changed to string
      topicId: "string", // Changed to string
    };

    // Validate each entry
    jsonData.forEach((entry, index) => {
      let invalidFields: string[] = [];

      // Check each field against the expected type
      for (const field of Object.keys(expectedFieldTypes) as ValidField[]) {
        const expectedType = expectedFieldTypes[field];
        const actualValue = entry[field];

        if (typeof actualValue !== expectedType) {
          invalidFields.push(
            `${field}: Expected ${expectedType}, but got ${typeof actualValue}`
          );
        } else if (
          expectedType === "object" &&
          Array.isArray(actualValue) &&
          field === "meaning"
        ) {
          // Special check for 'meaning' field, which should be an array of strings
          actualValue.forEach((item, idx) => {
            if (typeof item !== "string") {
              invalidFields.push(
                `meaning[${idx}]: Expected string, but got ${typeof item}`
              );
            }
          });
        }
      }

      // If there are any invalid fields, add them to invalidEntries
      if (invalidFields.length > 0) {
        invalidEntries.push({
          index,
          invalidFields,
        });
      }
    });

    // Response based on validation
    if (invalidEntries.length > 0) {
      res.status(400).json({
        message: "Invalid entries found",
        invalidEntries,
      });
    } else {
      res.status(200).json({
        message: "Entries are valid",
        count: validEntriesCount,
      });
    }
  } catch (error) {
    console.error("Error reading or parsing the file:", error);
    res.status(500).json({ error: "Error reading or parsing the file" });
  }
};

const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

// word suggestion query
export const wordQuery = async (req: any, res: any) => {
  const { query, type } = req.query;

  if (!query || !type) {
    return res.status(400).json({ error: "Query and type are required" });
  }

  try {
    let suggestions;

    // Check the type and query accordingly
    if (type === "synonyms") {
      suggestions = await prisma.word.findMany({
        where: {
          value: {
            contains: query, // Searching for words that contain the query
          },
        },
        include: {
          synonyms: true, // Include synonyms
        },
      });
    } else {
      return res.status(400).json({ error: "Invalid type parameter" });
    }

    // If no suggestions are found, return a meaningful error message
    if (suggestions.length === 0) {
      return res.status(404).json({ error: "No suggestions found" });
    }

    res.status(200).json(suggestions); // Return the found suggestions
  } catch (error) {
    console.error("Error fetching suggestions:", error);
    res.status(500).json({ error: "Error fetching suggestions" });
  }
};

import { Request } from "express";
import prisma from "../../../../shared/prisma";
import { Topic } from "@prisma/client";

// Create a new Topic
// const createTopic = async (
//   req: Request
// ): Promise<Topic | { message: string }> => {
//   const { name } = req.body;

//   if (!name) {
//     return { message: "Topic name is required" };
//   }

//   const newTopic = await prisma.topic.create({
//     data: { name },
//   });

//   return newTopic;
// };

const createTopic = async (
  req: Request
): Promise<Topic | { message: string }> => {
  const { name, levelId } = req.body;

  if (!name || !levelId) {
    return { message: "Topic name and levelId are required" };
  }

  try {
    const newTopic = await prisma.topic.create({
      data: {
        name,
        levelId,
      },
    });

    return newTopic;
  } catch (error) {
    console.error("Error creating topic:", error);
    return { message: "Failed to create topic" };
  }
};

// Get all Topics
const getAllTopicsFromDB = async (): Promise<Topic[]> => {
  const topics = await prisma.topic.findMany({
    orderBy: {
      id: "asc",
    },
  });
  return topics;
};

// Get Topic by ID
const getTopicFromDB = async (topicId: number): Promise<Topic | null> => {
  const topic = await prisma.topic.findUnique({
    where: { id: topicId },
  });
  return topic;
};

// Update Topic
const updateTopic = async (
  req: Request
): Promise<Topic | { message: string }> => {
  const { topicId } = req.params;
  const { name } = req.body;

  const parsedTopicId = parseInt(topicId, 10);
  if (isNaN(parsedTopicId)) {
    return { message: "Invalid Topic ID" };
  }

  const existingTopic = await prisma.topic.findUnique({
    where: { id: parsedTopicId },
  });

  if (!existingTopic) {
    return { message: "Topic not found" };
  }

  const updatedTopic = await prisma.topic.update({
    where: { id: parsedTopicId },
    data: { name },
  });

  return updatedTopic;
};

// Delete Topic
const deleteTopic = async (topicId: number): Promise<{ message: string }> => {
  if (!topicId) {
    return { message: "Topic ID is required" };
  }

  const existingTopic = await prisma.topic.findUnique({
    where: { id: topicId },
  });

  if (!existingTopic) {
    return { message: "Topic not found" };
  }

  await prisma.topic.delete({
    where: { id: topicId },
  });

  return { message: "Topic deleted successfully!" };
};

export const topicService = {
  createTopic,
  getAllTopicsFromDB,
  getTopicFromDB,
  updateTopic,
  deleteTopic,
};

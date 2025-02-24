import { Request } from "express";
import { Conversation } from "@prisma/client"; // Import necessary types
import prisma from "../../../shared/prisma";

// Create a new conversation
const createConversation = async (
  req: Request
): Promise<Conversation | { message: string }> => {
  const { topic, text, levelId } = req.body;

  // Validate required fields
  if (!topic || !text || !levelId) {
    return { message: "Topic, text, and levelId are required." };
  }

  // Check if the level exists
  const level = await prisma.level.findUnique({ where: { id: levelId } });
  if (!level) {
    return { message: "Level not found" }; // Return a message if level doesn't exist
  }

  // Validate that text is in the required format (i.e., JSON object with person-based keys)
  if (typeof text !== "object" || !text) {
    return { message: "Text should be a valid object with person-based keys." };
  }

  // Create the conversation with the provided data
  const conversation = await prisma.conversation.create({
    data: {
      topic,
      text, // Save the text as JSON
      levelId,
    },
  });

  return conversation;
};

// Get all conversations sorted by level
const getAllConversationsFromDB = async (): Promise<Conversation[]> => {
  const conversations = await prisma.conversation.findMany({
    orderBy: {
      levelId: "asc", // Sort conversations by the levelId in ascending order
    },
    include: {
      level: true, // Include level data in the result
    },
  });

  return conversations;
};

// Get a conversation by its ID
const getConversationFromDB = async (
  conversationId: number
): Promise<Conversation | null> => {
  const result = await prisma.conversation.findUnique({
    where: { id: conversationId },
    include: {
      level: true, // Include the related 'level' data
    },
  });

  return result;
};

// Update a conversation by its ID
const updateConversation = async (
  conversationId: number,
  data: { topic?: string; text?: any; levelId?: number }
): Promise<Conversation | { message: string }> => {
  const conversation = await prisma.conversation.findUnique({
    where: { id: conversationId },
  });

  if (!conversation) {
    return { message: "Conversation not found" };
  }

  if (data.levelId) {
    const level = await prisma.level.findUnique({
      where: { id: data.levelId },
    });
    if (!level) {
      return { message: "Level not found" };
    }
  }

  const updatedConversation = await prisma.conversation.update({
    where: { id: conversationId },
    data: {
      topic: data.topic || conversation.topic, // Preserve existing topic if not updated
      text: data.text || conversation.text, // Preserve existing text if not updated
      levelId: data.levelId || conversation.levelId, // Preserve existing levelId if not updated
    },
  });

  return updatedConversation;
};

// Delete a conversation by its ID
const deleteConversation = async (
  conversationId: number
): Promise<{ message: string }> => {
  const conversation = await prisma.conversation.findUnique({
    where: { id: conversationId },
  });

  if (!conversation) {
    return { message: "Conversation not found" };
  }

  await prisma.conversation.delete({
    where: { id: conversationId },
  });

  return { message: "Conversation deleted successfully" };
};

export const conversationService = {
  createConversation,
  getConversationFromDB,
  getAllConversationsFromDB,
  updateConversation,
  deleteConversation,
};

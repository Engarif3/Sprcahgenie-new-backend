import { Request, Response } from "express";
import httpStatus from "http-status";
import catchAsync from "../../../shared/catchAsync";
import { conversationService } from "./conversation.service";
import sendResponse from "../../../shared/sendResponse";

// Create a new conversation
const createConversation = catchAsync(async (req: Request, res: Response) => {
  const result = await conversationService.createConversation(req);

  if ((result as { message: string }).message) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: (result as { message: string }).message,
      data: {},
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.CREATED,
    success: true,
    message: "Conversation created successfully!",
    data: result, // Return created conversation data
  });
});

// Get all conversations sorted by level
const getAllConversations = catchAsync(async (req: Request, res: Response) => {
  const result = await conversationService.getAllConversationsFromDB();

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Conversations fetched successfully!",
    data: result,
  });
});

// Get a conversation by its ID
const getConversation = catchAsync(async (req: Request, res: Response) => {
  const { conversationId } = req.params;

  const parsedConversationId = parseInt(conversationId, 10);

  if (isNaN(parsedConversationId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid conversation ID",
      data: null,
    });
  }

  const result = await conversationService.getConversationFromDB(
    parsedConversationId
  );

  if (!result) {
    return sendResponse(res, {
      statusCode: httpStatus.NOT_FOUND,
      success: false,
      message: "Conversation not found",
      data: null,
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Conversation fetched successfully!",
    data: result,
  });
});

const updateConversation = catchAsync(async (req: Request, res: Response) => {
  const { conversationId } = req.params;
  const { topic, text, levelId } = req.body;

  const parsedConversationId = parseInt(conversationId, 10);

  if (isNaN(parsedConversationId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid conversation ID",
      data: null,
    });
  }

  const result = await conversationService.updateConversation(
    parsedConversationId,
    {
      topic,
      text,
      levelId,
    }
  );

  if ((result as { message: string }).message) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: (result as { message: string }).message,
      data: null,
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Conversation updated successfully!",
    data: result,
  });
});

// Delete a conversation
// const deleteConversation = catchAsync(async (req: Request, res: Response) => {
//   const { conversationId } = req.params;

//   const parsedConversationId = parseInt(conversationId, 10);

//   if (isNaN(parsedConversationId)) {
//     return sendResponse(res, {
//       statusCode: httpStatus.BAD_REQUEST,
//       success: false,
//       message: "Invalid conversation ID",
//       data: null,
//     });
//   }

//   const result = await conversationService.deleteConversation(
//     parsedConversationId
//   );

//   if ((result as { message: string }).message) {
//     return sendResponse(res, {
//       statusCode: httpStatus.BAD_REQUEST,
//       success: false,
//       message: (result as { message: string }).message,
//       data: null,
//     });
//   }

//   sendResponse(res, {
//     statusCode: httpStatus.OK,
//     success: true,
//     message: "Conversation deleted successfully!",
//     data: null,
//   });
// });
const deleteConversation = catchAsync(async (req: Request, res: Response) => {
  const { conversationId } = req.params;

  const parsedConversationId = parseInt(conversationId, 10);

  if (isNaN(parsedConversationId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid conversation ID",
      data: null,
    });
  }

  const result = await conversationService.deleteConversation(
    parsedConversationId
  );

  // Check for errors properly
  if ((result as { message: string }).message === "Conversation not found") {
    return sendResponse(res, {
      statusCode: httpStatus.NOT_FOUND, // Use NOT_FOUND for this case
      success: false,
      message: (result as { message: string }).message,
      data: null,
    });
  }

  // Successful deletion
  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: (result as { message: string }).message,
    data: null,
  });
});

export const conversationController = {
  createConversation,
  getAllConversations,
  getConversation,
  updateConversation,
  deleteConversation,
};

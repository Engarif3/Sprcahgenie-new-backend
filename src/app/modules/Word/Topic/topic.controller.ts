import { Request, Response } from "express";
import httpStatus from "http-status";
import catchAsync from "../../../../shared/catchAsync";
import { topicService } from "./topic.service";
import sendResponse from "../../../../shared/sendResponse";

// Create a new Topic
const createTopic = catchAsync(async (req: Request, res: Response) => {
  const result = await topicService.createTopic(req);

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
    message: "Topic created successfully!",
    data: result,
  });
});

// Get all Topics
const getAllTopics = catchAsync(async (req: Request, res: Response) => {
  const result = await topicService.getAllTopicsFromDB();

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Topics fetched successfully!",
    data: result,
  });
});

// Get Topic by ID
const getTopic = catchAsync(async (req: Request, res: Response) => {
  const { topicId } = req.params;

  const parsedTopicId = parseInt(topicId, 10);

  if (isNaN(parsedTopicId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid Topic ID",
      data: null,
    });
  }

  const result = await topicService.getTopicFromDB(parsedTopicId);

  if (!result) {
    return sendResponse(res, {
      statusCode: httpStatus.NOT_FOUND,
      success: false,
      message: "Topic not found",
      data: null,
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Topic fetched successfully!",
    data: result,
  });
});

// Update Topic
const updateTopic = catchAsync(async (req: Request, res: Response) => {
  const result = await topicService.updateTopic(req);

  if ((result as { message: string }).message) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: (result as { message: string }).message,
      data: {},
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Topic updated successfully!",
    data: result,
  });
});

// Delete Topic
const deleteTopic = catchAsync(async (req: Request, res: Response) => {
  const { topicId } = req.params;
  const parsedTopicId = parseInt(topicId, 10);

  if (isNaN(parsedTopicId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid Topic ID",
      data: null,
    });
  }

  const result = await topicService.deleteTopic(parsedTopicId);

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: result.message,
    data: null,
  });
});

export const topicController = {
  createTopic,
  getAllTopics,
  getTopic,
  updateTopic,
  deleteTopic,
};

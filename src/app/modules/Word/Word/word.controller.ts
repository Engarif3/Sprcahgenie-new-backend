import { Request, Response } from "express";
import httpStatus from "http-status";
import { wordService } from "./word.service";
import catchAsync from "../../../../shared/catchAsync";
import sendResponse from "../../../../shared/sendResponse";

// Create a new Word
const createWordController = catchAsync(async (req: Request, res: Response) => {
  const userId = req.body?.createdBy;
  // const userId = req.header("Authorization");
  console.log(req.headers);
  console.log("user", userId);
  if (!userId) {
    return sendResponse(res, {
      statusCode: httpStatus.UNAUTHORIZED,
      success: false,
      message: "User not authenticated",
      data: {},
    });
  }
  const result = await wordService.createWord(req, userId);

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
    message: "Word created successfully!",
    data: result, // Return created word data
  });
});

// ======================get all words ========================
const getWordsList = catchAsync(async (req: Request, res: Response) => {
  // Parse query parameters
  const showAll = req.query.all === "true";
  const page = req.query.page ? parseInt(req.query.page as string) : 1;
  const limit = req.query.limit ? parseInt(req.query.limit as string) : 50;
  const level = (req.query.level as string) || "";
  const topic = (req.query.topic as string) || "";

  // Get data from service
  const result = await wordService.getWordsListFromDB({
    showAll,
    page,
    limit,
    level,
    topic,
  });

  // Send response
  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Words retrieved successfully",
    data: result,
  });
});

// =======================get single word==============================
const getSingleWordController = catchAsync(
  async (req: Request, res: Response) => {
    const { idOrValue } = req.params;

    const result = await wordService.getSingleWordFromDB(idOrValue);

    if (!result) {
      return sendResponse(res, {
        statusCode: httpStatus.NOT_FOUND,
        success: false,
        message: "Word not found",
        data: null,
      });
    }

    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: "Word retrieved successfully...",
      data: result,
    });
  }
);
// =============================update word ==========================================
const updateWordController = catchAsync(async (req: Request, res: Response) => {
  const userId = req.body?.userId;
  const { id } = req.params;
  const parsedId = parseInt(id, 10);

  if (isNaN(parsedId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid word ID",
      data: null,
    });
  }

  const result = await wordService.updateWordInDB(parsedId, req.body, userId);

  if ("message" in result) {
    const statusCode =
      result.message === "Word not found"
        ? httpStatus.NOT_FOUND
        : httpStatus.BAD_REQUEST;

    return sendResponse(res, {
      statusCode,
      success: false,
      message: result.message,
      data: null,
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Word updated successfully",
    data: result,
  });
});

// =================delete a word ========================
const deleteWordController = catchAsync(async (req: Request, res: Response) => {
  const { id } = req.params;
  const parsedId = parseInt(id, 10);

  if (isNaN(parsedId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid word ID",
      data: null,
    });
  }

  const result = await wordService.deleteWordFromDB(parsedId);

  if (!result.deletedWord) {
    return sendResponse(res, {
      statusCode: httpStatus.NOT_FOUND,
      success: false,
      message: result.message,
      data: null,
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: result.message,
    data: result.deletedWord,
  });
});

const deleteAllWordsController = catchAsync(
  async (req: Request, res: Response) => {
    const result = await wordService.deleteAllWordsFromDB();

    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: result.message,
      data: null,
    });
  }
);

export const wordController = {
  createWordController,
  getWordsList,
  getSingleWordController,
  updateWordController,
  deleteWordController,
  deleteAllWordsController,
};

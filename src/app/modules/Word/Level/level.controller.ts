import { Request, Response } from "express";
import httpStatus from "http-status";
import { levelService } from "./level.service";
import catchAsync from "../../../../shared/catchAsync";
import sendResponse from "../../../../shared/sendResponse";

// Create a new Level
const createLevelController = catchAsync(
  async (req: Request, res: Response) => {
    const result = await levelService.createLevel(req);

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
      message: "Level created successfully!",
      data: result, // Return created Level data
    });
  }
);

// Get all Levels
const getAllLevelsController = catchAsync(
  async (req: Request, res: Response) => {
    const result = await levelService.getAllLevelsFromDB();

    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: "Levels fetched successfully!",
      data: result,
    });
  }
);

// Get Level by ID
const getLevelController = catchAsync(async (req: Request, res: Response) => {
  const { levelId } = req.params;

  const parsedLevelId = parseInt(levelId, 10);

  if (isNaN(parsedLevelId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid Level ID",
      data: null,
    });
  }

  const result = await levelService.getLevelFromDB(parsedLevelId);

  if (!result) {
    return sendResponse(res, {
      statusCode: httpStatus.NOT_FOUND,
      success: false,
      message: "Level not found",
      data: null,
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Level fetched successfully!",
    data: result,
  });
});

// Update Level
const updateLevelController = catchAsync(
  async (req: Request, res: Response) => {
    const { levelId } = req.params;
    const { levelName } = req.body;

    const parsedLevelId = parseInt(levelId, 10);

    if (isNaN(parsedLevelId)) {
      return sendResponse(res, {
        statusCode: httpStatus.BAD_REQUEST,
        success: false,
        message: "Invalid Level ID",
        data: null,
      });
    }

    const result = await levelService.updateLevel(parsedLevelId, levelName);

    if ((result as { message: string }).message) {
      return sendResponse(res, {
        statusCode: httpStatus.NOT_FOUND,
        success: false,
        message: (result as { message: string }).message,
        data: null,
      });
    }

    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: "Level updated successfully!",
      data: result,
    });
  }
);

// Delete Level (soft delete)
const deleteLevelController = catchAsync(
  async (req: Request, res: Response) => {
    const { levelId } = req.params;

    const parsedLevelId = parseInt(levelId, 10);

    if (isNaN(parsedLevelId)) {
      return sendResponse(res, {
        statusCode: httpStatus.BAD_REQUEST,
        success: false,
        message: "Invalid Level ID",
        data: null,
      });
    }

    const result = await levelService.deleteLevel(parsedLevelId);

    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: result.message,
      data: {},
    });
  }
);

export const levelController = {
  createLevelController,
  getAllLevelsController,
  getLevelController,
  updateLevelController,
  deleteLevelController,
};

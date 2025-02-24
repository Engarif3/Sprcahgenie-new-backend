import { Request, Response } from "express";
import httpStatus from "http-status";
import catchAsync from "../../../shared/catchAsync";
import sendResponse from "../../../shared/sendResponse";
import { prefixService } from "./prefix.service";

// Create a new PrefixType
const createPrefixType = catchAsync(async (req: Request, res: Response) => {
  const result = await prefixService.createPrefixType(req);

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
    message: "PrefixType created successfully!",
    data: result, // Return created PrefixType data
  });
});

// Get all PrefixTypes
const getAllPrefixTypes = catchAsync(async (req: Request, res: Response) => {
  const result = await prefixService.getAllPrefixTypesFromDB();

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "PrefixTypes fetched successfully!",
    data: result,
  });
});

// Get a PrefixType by ID
const getPrefixType = catchAsync(async (req: Request, res: Response) => {
  const { prefixTypeId } = req.params;

  const parsedPrefixTypeId = parseInt(prefixTypeId, 10);

  if (isNaN(parsedPrefixTypeId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid PrefixType ID",
      data: null,
    });
  }

  const result = await prefixService.getPrefixTypeFromDB(parsedPrefixTypeId);

  if (!result) {
    return sendResponse(res, {
      statusCode: httpStatus.NOT_FOUND,
      success: false,
      message: "PrefixType not found",
      data: null,
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "PrefixType fetched successfully!",
    data: result,
  });
});

// Create a new Prefix
// const createPrefix = catchAsync(async (req: Request, res: Response) => {
//   const result = await prefixService.createPrefix(req);

//   // If there is an error message in the result, return a bad request response
//   if ((result as { message: string }).message) {
//     return sendResponse(res, {
//       statusCode: httpStatus.BAD_REQUEST,
//       success: false,
//       message: (result as { message: string }).message,
//       data: {},
//     });
//   }

//   // If no error, send a successful response with the created prefix data
//   sendResponse(res, {
//     statusCode: httpStatus.CREATED,
//     success: true,
//     message: "Prefix created successfully!",
//     data: result, // Return the created Prefix object
//   });
// });
const createPrefix = catchAsync(async (req: Request, res: Response) => {
  const result = await prefixService.createPrefix(req);

  // If there is an error message in the result, return a bad request response
  if ((result as { message: string }).message) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: (result as { message: string }).message,
      data: {},
    });
  }

  // If no error, send a successful response with the created prefix data
  sendResponse(res, {
    statusCode: httpStatus.CREATED,
    success: true,
    message: "Prefix created successfully!",
    data: result, // Return the created Prefix object
  });
});

// Get all Prefixes
const getAllPrefixes = catchAsync(async (req: Request, res: Response) => {
  const result = await prefixService.getAllPrefixesFromDB();

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Prefixes fetched successfully!",
    data: result,
  });
});

// Get a Prefix by ID
const getPrefix = catchAsync(async (req: Request, res: Response) => {
  const { prefixId } = req.params;

  const parsedPrefixId = parseInt(prefixId, 10);

  if (isNaN(parsedPrefixId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid Prefix ID",
      data: null,
    });
  }

  const result = await prefixService.getPrefixFromDB(parsedPrefixId);

  if (!result) {
    return sendResponse(res, {
      statusCode: httpStatus.NOT_FOUND,
      success: false,
      message: "Prefix not found",
      data: null,
    });
  }

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Prefix fetched successfully!",
    data: result,
  });
});

const updatePrefix = catchAsync(async (req: Request, res: Response) => {
  const result = await prefixService.updatePrefix(req);

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
    message: "Prefix updated successfully!",
    data: result,
  });
});

// Delete Prefix
const deletePrefix = catchAsync(async (req: Request, res: Response) => {
  const { prefixId } = req.params;
  const parsedPrefixId = parseInt(prefixId, 10);

  if (isNaN(parsedPrefixId)) {
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST,
      success: false,
      message: "Invalid Prefix ID",
      data: null,
    });
  }

  const result = await prefixService.deletePrefix(parsedPrefixId);

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: result.message,
    data: null,
  });
});
export const prefixController = {
  createPrefixType,
  getAllPrefixTypes,
  getPrefixType,
  createPrefix,
  getAllPrefixes,
  getPrefix,
  updatePrefix,
  deletePrefix,
};

import { Request, Response } from "express";
import catchAsync from "../../../shared/catchAsync";
import { AuthServices } from "./auth.service";
import sendResponse from "../../../shared/sendResponse";
import httpStatus from "http-status";
import config from "../../../config";

const loginUser = catchAsync(async (req: Request, res: Response) => {
  const { ...loginData } = req.body;
  const result = await AuthServices.loginUser(loginData);

  const { accessToken, refreshToken, needPasswordChange } = result;

  // Set access token in HTTP-only cookie
  res.cookie("accessToken", accessToken, {
    secure: config.env === "production", // send only over HTTPS in production
    httpOnly: true, // inaccessible via JavaScript
    sameSite: "strict", // prevents CSRF
    maxAge: 15 * 60 * 1000, // 15 minutes (or match your JWT expiry)
  });

  // Set refresh token in HTTP-only cookie
  res.cookie("refreshToken", refreshToken, {
    secure: config.env === "production",
    httpOnly: true,
    sameSite: "strict",
    maxAge: 7 * 24 * 60 * 60 * 1000, // 7 days (or match refresh token expiry)
  });

  // Send response (without accessToken if you want to hide it from frontend)
  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Logged in successfully!",
    data: {
      needPasswordChange,
    },
  });
});

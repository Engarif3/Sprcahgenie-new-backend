import { Request, Response } from "express";
import catchAsync from "../../../shared/catchAsync";
import { AuthServices } from "./auth.service";
import sendResponse from "../../../shared/sendResponse";
import httpStatus from "http-status";
import prisma from "../../../shared/prisma";
import { jwtHelpers } from "../../../helpers/jwtHelpers";
import config from "../../../config";
import { Secret } from "jsonwebtoken";
import emailSender from "./emailSender";

// const loginUser = catchAsync(async (req: Request, res: Response) => {
//   const result = await AuthServices.loginUser(req.body);
//   console.log(result);
//   const { refreshToken } = result;

//   res.cookie("refreshToken", refreshToken, {
//     secure: false,
//     httpOnly: true,
//   });

//   sendResponse(res, {
//     statusCode: httpStatus.OK,
//     success: true,
//     message: "Logged in successfully!",
//     data: {
//       accessToken: result.accessToken,
//       needPasswordChange: result.needPasswordChange,
//     },
//   });
// });

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

const getCurrentUser = catchAsync(
  async (req: Request & { user?: any }, res: Response) => {
    const userId = req.user?.id;

    const result = await AuthServices.getCurrentUser(userId);

    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: "Current user fetched successfully!",
      data: result,
    });
  }
);

const refreshToken = catchAsync(async (req: Request, res: Response) => {
  const { refreshToken } = req.cookies;

  const result = await AuthServices.refreshToken(refreshToken);

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Access token genereated successfully!",
    data: result,
    // data: {
    //     accessToken: result.accessToken,
    //     needPasswordChange: result.needPasswordChange
    // }
  });
});

const changePassword = catchAsync(
  async (req: Request & { user?: any }, res: Response) => {
    const user = req.user;

    const result = await AuthServices.changePassword(user, req.body);

    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: "Password Changed successfully",
      data: result,
    });
  }
);

const forgotPassword = catchAsync(async (req: Request, res: Response) => {
  await AuthServices.forgotPassword(req.body);

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Check your email!",
    data: null,
  });
});

const resetPassword = catchAsync(async (req: Request, res: Response) => {
  const { token, id, password } = req.body;

  if (!token || !id || !password) {
    throw new Error("Missing required fields!");
  }

  await AuthServices.resetPassword(token, { id, password });

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Password Reset!",
    data: null,
  });
});

// ==============================get reset pass ==========================

// ======================================

const resendVerificationEmail = async (req: Request, res: Response) => {
  const { email } = req.body;

  if (!email) {
    return res.status(400).send("Email address is required!");
  }

  try {
    const user = await prisma.user.findUnique({
      where: { email },
    });

    if (!user) {
      return res.status(400).send("User not found!");
    }

    if (user.status === "ACTIVE") {
      return res.status(400).send("This email is already verified!");
    }

    // Generate a new verification token
    let verificationToken;
    try {
      verificationToken = jwtHelpers.generateToken(
        { email: user.email },
        config.jwt.verification_token_secret as Secret,
        config.jwt.verification_token_expires_in || "1h"
      );
    } catch (error) {
      console.error("Error generating verification token:", error);
      return res.status(500).send("Failed to generate verification token.");
    }

    // Generate the verification link
    const verificationLink = `${config.verification_link}?token=${verificationToken}`;

    // Send verification email
    await emailSender(
      user.email,
      `
        <div>
          <p>Dear ${user.email},</p>
          <p>Your verification link has expired or is invalid. Please verify your email by clicking the link below:</p>
          <a href="${verificationLink}">
            <button>Verify Email</button>
          </a>
        </div>
      `,
      "Verify Your Email"
    );

    return res.status(200).send("Verification email resent successfully!");
  } catch (error) {
    console.error("Error resending verification email:", error);
    return res
      .status(500)
      .send("An error occurred while resending the verification email.");
  }
};

// ======================================

export const AuthController = {
  loginUser,
  getCurrentUser,
  refreshToken,
  changePassword,
  forgotPassword,
  resetPassword,
  resendVerificationEmail,
};

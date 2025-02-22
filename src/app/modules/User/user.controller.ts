import { Request, RequestHandler, Response } from "express";
import { userService } from "./user.sevice";
import catchAsync from "../../../shared/catchAsync";
import sendResponse from "../../../shared/sendResponse";
import httpStatus from "http-status";
import pick from "../../../shared/pick";
import { userFilterableFields } from "./user.constant";
import { UserRole } from "@prisma/client";
import { JwtPayload } from "jsonwebtoken";
import { IAuthUser } from "../../interfaces/common";
import { AuthServices } from "../Auth/auth.service";

const createAdmin = catchAsync(async (req: Request, res: Response) => {
  const result = await userService.createAdmin(req);
  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Admin Created successfully!",
    data: result,
  });
});

// const createBasicUser = catchAsync(async (req: Request, res: Response) => {
//   const result = await userService.createBasicUser(req);
//   sendResponse(res, {
//     statusCode: httpStatus.OK,
//     success: true,
//     message: "User created successfully!",
//     data: result,
//   });
// });

const createBasicUser = catchAsync(async (req: Request, res: Response) => {
  const result = await userService.createBasicUser(req);

  if (result.message) {
    // Handle the error message for duplicate or pending users
    return sendResponse(res, {
      statusCode: httpStatus.BAD_REQUEST, // Or another appropriate status code
      success: false,
      message: result.message, // The message coming from createBasicUser function
      data: result, // Pass null or an empty object as data to satisfy the type
    });
  }

  // If no message, user was successfully created, continue
  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "User created successfully!",
    data: result, // The actual result data when the user is created successfully
  });
});

const getAllFromDB = catchAsync(async (req: Request, res: Response) => {
  // console.log(req.query)
  const filters = pick(req.query, userFilterableFields);
  const options = pick(req.query, ["limit", "page", "sortBy", "sortOrder"]);

  const result = await userService.getAllFromDB(filters, options);

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Users data fetched!",
    meta: result.meta,
    data: result.data,
  });
});

const changeProfileStatus = catchAsync(async (req: Request, res: Response) => {
  const { id } = req.params;
  const result = await userService.changeProfileStatus(id, req.body);

  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: "Users profile status changed!",
    data: result,
  });
});

const getMyProfile = catchAsync(
  async (req: Request & { user?: IAuthUser }, res: Response) => {
    const user = req.user;
    console.log(user);

    const result = await userService.getMyProfile(user as IAuthUser);

    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: "My profile data fetched!",
      data: result,
    });
  }
);

const updateMyProfie = catchAsync(
  async (req: Request & { user?: IAuthUser }, res: Response) => {
    const user = req.user;

    const result = await userService.updateMyProfie(user as IAuthUser, req);

    sendResponse(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: "My profile updated!",
      data: result,
    });
  }
);

// ===================================
// const verifyUserEmail = catchAsync(async (req: Request, res: Response) => {
//   const token = req.query.token as string;

//   const result = await AuthServices.verifyEmail(token);
//   console.log("Result:", result); // Debug log

//   sendResponse(res, {
//     statusCode: httpStatus.OK,
//     success: true,
//     message: result.message,
//     data: null,
//   });
// });
const verifyUserEmail = catchAsync(async (req: Request, res: Response) => {
  const token = req.query.token as string;

  try {
    const result = await AuthServices.verifyEmail(token);

    // Render a success HTML page after email verification
    return res.send(`
      <html>
        <head>
          <title>Email Verified</title>
          <style>
            body {
              font-family: Arial, sans-serif;
              text-align: center;
              padding: 20px;
            }
            .message {
              background-color: #4CAF50;
              color: white;
              padding: 15px;
              border-radius: 5px;
            }
            .button {
              background-color: #008CBA;
              color: white;
              padding: 10px 20px;
              border: none;
              cursor: pointer;
              border-radius: 5px;
              text-decoration: none;
            }
            .button:hover {
              background-color: #005f75;
            }
          </style>
        </head>
        <body>
          <div class="message">
            <h2>Email Verified Successfully!</h2>
            <p>You can now log in to your account.</p>
            <a href="https://sprach-genie.netlify.app/login" class="button">Go to Login</a>
          </div>
        </body>
      </html>
    `);
  } catch (err: any) {
    console.error("Error:", err.message);
    // Handle error by rendering an error page
    return res.send(`
      <html>
        <head>
          <title>Error</title>
          <style>
            body {
              font-family: Arial, sans-serif;
              text-align: center;
              padding: 20px;
            }
            .error {
              background-color: #f44336;
              color: white;
              padding: 15px;
              border-radius: 5px;
            }
            .button {
              background-color: #008CBA;
              color: white;
              padding: 10px 20px;
              border: none;
              cursor: pointer;
              border-radius: 5px;
              text-decoration: none;
            }
            .button:hover {
              background-color: #005f75;
            }
          </style>
        </head>
        <body>
          <div class="error">
            <h2>Invalid or Expired Verification Link!</h2>
            <!--
            <p>Please check your email again or request a new verification link.</p>
            <a href="/resend-verification" class="button">Resend Verification Link</a>
            -->
          </div>
        </body>
      </html>
    `);
  }
});

// ===================================

export const userController = {
  createAdmin,
  createBasicUser,
  getAllFromDB,
  changeProfileStatus,
  getMyProfile,
  updateMyProfie,
  verifyUserEmail,
};

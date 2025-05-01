import {
  Admin,
  BasicUser,
  Prisma,
  User,
  UserRole,
  UserStatus,
} from "@prisma/client";
import * as bcrypt from "bcrypt";
import prisma from "../../../shared/prisma";
import { fileUploader } from "../../../helpers/fileUploader";
import { IFile } from "../../interfaces/file";
import { Request } from "express";
import { IPaginationOptions } from "../../interfaces/pagination";
import { paginationHelper } from "../../../helpers/paginationHelper";
import { userSearchAbleFields } from "./user.constant";
import { IAuthUser } from "../../interfaces/common";
import emailSender from "../Auth/emailSender";
import config from "../../../config";
import {
  generateVerificationToken,
  jwtHelpers,
} from "../../../helpers/jwtHelpers";
import { Secret } from "jsonwebtoken";

//previously working code

const createBasicUser = async (
  req: Request
): Promise<{ message: string; pending?: boolean }> => {
  const file = req.file as IFile;

  // Handle file upload for profile photo
  if (file) {
    const uploadedProfileImage = await fileUploader.uploadToCloudinary(file);
    req.body.basicUser.profilePhoto = uploadedProfileImage?.secure_url;
  }

  // Hash the password
  const hashedPassword: string = await bcrypt.hash(req.body.password, 12);

  // Generate a verification token
  const verificationToken = jwtHelpers.generateToken(
    { email: req.body.basicUser.email },
    config.jwt.verification_token_secret as Secret,
    config.jwt.verification_token_expires_in as string
  );

  // Check if the user already exists by email
  const existingUser = await prisma.user.findUnique({
    where: { email: req.body.basicUser.email },
  });
  if (existingUser) {
    // Handle existing user based on status
    if (existingUser.status === "ACTIVE") {
      return {
        message: "User already exists",
      };
    } else if (existingUser.status === "BLOCKED") {
      return {
        message: "Your account is blocked",
      };
    } else if (existingUser.status === "PENDING") {
      return {
        message: "Please verify your email before logging in.",
        pending: true,
      };
    }
  }

  // User data to be inserted
  const userData = {
    email: req.body.basicUser.email,
    name: req.body.basicUser.name,
    password: hashedPassword,
    role: UserRole.BASIC_USER,
    status: UserStatus.PENDING, // User status is set to PENDING
    verificationToken: generateVerificationToken(), // New verification token
  };

  // Start a transaction to create both user and basicUser
  await prisma.$transaction(async (transactionClient) => {
    // Create user
    const createdUser = await transactionClient.user.create({
      data: userData,
    });

    // Create basicUser
    const createdBasicUser = await transactionClient.basicUser.create({
      data: {
        name: req.body.basicUser.name,
        contactNumber: req.body.basicUser.contactNumber,
        address: req.body.basicUser.address,
        profilePhoto: req.body.basicUser.profilePhoto, // If there's a profile photo
        user: {
          connect: { email: createdUser.email, name: createdUser.name }, // Connect the created user to the basicUser
        },
      },
    });

    return createdBasicUser;
  });

  // Send verification email
  const verificationLink = `${config.verification_link}?token=${verificationToken}`;
  await emailSender(
    req.body.basicUser.email,
    `
       <div>
           <p>Dear User,</p>
           <p>Please verify your email by clicking the link below:</p>
           <a href="${verificationLink}">
               <button>Verify Email</button>
           </a>
       </div>
     `,
    "Verify Your Email"
  );

  return { message: "Please check your email to verify your account!" };
};

// currently used code
const createBasicUser1 = async (
  req: Request
): Promise<{ message: string; pending?: boolean }> => {
  const file = req.file as IFile;

  // Handle file upload for profile photo
  if (file) {
    const uploadedProfileImage = await fileUploader.uploadToCloudinary(file);
    req.body.basicUser.profilePhoto = uploadedProfileImage?.secure_url;
  }

  // Hash the password
  const hashedPassword: string = await bcrypt.hash(req.body.password, 12);

  // Generate a verification token
  const verificationToken = jwtHelpers.generateToken(
    { email: req.body.basicUser.email },
    config.jwt.verification_token_secret as Secret,
    config.jwt.verification_token_expires_in as string
  );

  // Check if the user already exists by email
  const existingUser = await prisma.user.findUnique({
    where: { email: req.body.basicUser.email },
  });

  if (existingUser) {
    // Handle existing user based on status
    if (existingUser.status === "ACTIVE") {
      return {
        message: "User already exists",
      };
    } else if (existingUser.status === "BLOCKED") {
      return {
        message: "Your account is blocked",
      };
    } else if (existingUser.status === "PENDING") {
      // Update token and re-send verification email
      await prisma.user.update({
        where: { email: existingUser.email },
        data: { verificationToken },
      });

      const verificationLink = `${config.verification_link}?token=${verificationToken}`;
      await emailSender(
        existingUser.email,
        `
            <div>
                <p>Dear User,</p>
                <p>Please verify your email by clicking the link below:</p>
                <a href="${verificationLink}">
                    <button>Verify Email</button>
                </a>
            </div>
          `,
        "Verify Your Email"
      );

      return {
        message:
          "Please verify your email before logging in. We've re-sent the verification link.",
        pending: true,
      };
    }
  }

  // User data to be inserted
  const userData = {
    email: req.body.basicUser.email,
    name: req.body.basicUser.name,
    password: hashedPassword,
    role: UserRole.BASIC_USER,
    status: UserStatus.PENDING,
    verificationToken,
  };

  // Start a transaction to create both user and basicUser
  await prisma.$transaction(async (transactionClient) => {
    const createdUser = await transactionClient.user.create({
      data: userData,
    });

    await transactionClient.basicUser.create({
      data: {
        name: req.body.basicUser.name,
        contactNumber: req.body.basicUser.contactNumber,
        address: req.body.basicUser.address,
        profilePhoto: req.body.basicUser.profilePhoto,
        user: {
          connect: { email: createdUser.email, name: createdUser.name },
        },
      },
    });
  });

  // Send verification email
  const verificationLink = `${config.verification_link}?token=${verificationToken}`;
  await emailSender(
    req.body.basicUser.email,
    `
        <div>
            <p>Dear User,</p>
            <p>Please verify your email by clicking the link below:</p>
            <a href="${verificationLink}">
                <button>Verify Email</button>
            </a>
        </div>
      `,
    "Verify Your Email"
  );

  return { message: "Please check your email to verify your account!" };
};
export const userService1 = {
  createBasicUser,
  createBasicUser1,
};

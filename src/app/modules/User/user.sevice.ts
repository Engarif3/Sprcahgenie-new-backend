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

const createAdmin = async (req: Request): Promise<Admin> => {
  const file = req.file as IFile;

  if (file) {
    const uploadToCloudinary = await fileUploader.uploadToCloudinary(file);
    req.body.admin.profilePhoto = uploadToCloudinary?.secure_url;
  }

  const hashedPassword: string = await bcrypt.hash(req.body.password, 12);

  const userData = {
    email: req.body.admin.email,
    password: hashedPassword,
    role: UserRole.ADMIN,
  };

  const result = await prisma.$transaction(async (transactionClient) => {
    await transactionClient.user.create({
      data: userData,
    });

    const createdAdminData = await transactionClient.admin.create({
      data: req.body.admin,
    });

    return createdAdminData;
  });

  return result;
};

// =============================================
// ============
// const createBasicUser = async (
//   req: Request
// ): Promise<{ message: string; pending?: boolean }> => {
//   const file = req.file as IFile;

//   // Handle file upload for profile photo
//   if (file) {
//     const uploadedProfileImage = await fileUploader.uploadToCloudinary(file);
//     req.body.basicUser.profilePhoto = uploadedProfileImage?.secure_url;
//   }

//   // Hash the password
//   const hashedPassword: string = await bcrypt.hash(req.body.password, 12);

//   // Generate a verification token
//   const verificationToken = jwtHelpers.generateToken(
//     { email: req.body.basicUser.email },
//     config.jwt.verification_token_secret as Secret,
//     config.jwt.verification_token_expires_in as string
//   );

//   // Check if the user already exists by email
//   const existingUser = await prisma.user.findUnique({
//     where: { email: req.body.basicUser.email },
//   });

//   if (existingUser) {
//     // Handle existing user based on status
//     if (existingUser.status === "ACTIVE") {
//       return {
//         message: "User already exists",
//       };
//     } else if (existingUser.status === "BLOCKED") {
//       return {
//         message: "Your account is blocked",
//       };
//     } else if (existingUser.status === "PENDING") {
//       return {
//         message: "Please verify your email before logging in.",
//         pending: true,
//       };
//     }
//   }

//   // User data to be inserted
//   const userData = {
//     email: req.body.basicUser.email,
//     name: req.body.basicUser.name,
//     password: hashedPassword,
//     role: UserRole.BASIC_USER,
//     status: UserStatus.PENDING, // User status is set to PENDING
//     verificationToken: generateVerificationToken(), // New verification token
//   };

//   // Start a transaction to create both user and basicUser
//   await prisma.$transaction(async (transactionClient) => {
//     // Create user
//     const createdUser = await transactionClient.user.create({
//       data: userData,
//     });

//     // Create basicUser
//     const createdBasicUser = await transactionClient.basicUser.create({
//       data: {
//         name: req.body.basicUser.name,
//         contactNumber: req.body.basicUser.contactNumber,
//         address: req.body.basicUser.address,
//         profilePhoto: req.body.basicUser.profilePhoto, // If there's a profile photo
//         user: {
//           connect: { email: createdUser.email, name: createdUser.name }, // Connect the created user to the basicUser
//         },
//       },
//     });

//     return createdBasicUser;
//   });

//   // Send verification email
//   const verificationLink = `${config.verification_link}?token=${verificationToken}`;
//   await emailSender(
//     req.body.basicUser.email,
//     `
//       <div>
//           <p>Dear User,</p>
//           <p>Please verify your email by clicking the link below:</p>
//           <a href="${verificationLink}">
//               <button>Verify Email</button>
//           </a>
//       </div>
//     `,
//     "Verify Your Email"
//   );

//   return { message: "Please check your email to verify your account!" };
// };
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

// ============
// ================================
const getAllFromDB = async (params: any, options: IPaginationOptions) => {
  const { page, limit, skip } = paginationHelper.calculatePagination(options);
  const { searchTerm, ...filterData } = params;

  const andCondions: Prisma.UserWhereInput[] = [];

  //console.log(filterData);
  if (params.searchTerm) {
    andCondions.push({
      OR: userSearchAbleFields.map((field) => ({
        [field]: {
          contains: params.searchTerm,
          mode: "insensitive",
        },
      })),
    });
  }

  if (Object.keys(filterData).length > 0) {
    andCondions.push({
      AND: Object.keys(filterData).map((key) => ({
        [key]: {
          equals: (filterData as any)[key],
        },
      })),
    });
  }

  const whereConditons: Prisma.UserWhereInput =
    andCondions.length > 0 ? { AND: andCondions } : {};

  const result = await prisma.user.findMany({
    where: whereConditons,
    skip,
    take: limit,
    orderBy:
      options.sortBy && options.sortOrder
        ? {
            [options.sortBy]: options.sortOrder,
          }
        : {
            createdAt: "desc",
          },
    select: {
      id: true,
      name: true,
      email: true,
      role: true,
      needPasswordChange: true,
      status: true,
      createdAt: true,
      updatedAt: true,
      admin: true,
      basicUser: true,
    },
  });

  const total = await prisma.user.count({
    where: whereConditons,
  });

  return {
    meta: {
      page,
      limit,
      total,
    },
    data: result,
  };
};

const changeProfileStatus = async (id: string, status: UserRole) => {
  const userData = await prisma.user.findUniqueOrThrow({
    where: {
      id,
    },
  });

  const updateUserStatus = await prisma.user.update({
    where: {
      id,
    },
    data: status,
  });

  return updateUserStatus;
};

const getMyProfile = async (user: IAuthUser) => {
  const userInfo = await prisma.user.findUniqueOrThrow({
    where: {
      email: user?.email,
      status: UserStatus.ACTIVE,
    },
    select: {
      id: true,
      email: true,
      needPasswordChange: true,
      role: true,
      status: true,
    },
  });

  let profileInfo;

  if (userInfo.role === UserRole.SUPER_ADMIN) {
    profileInfo = await prisma.admin.findUnique({
      where: {
        // email: userInfo.email,
        userId: userInfo.id,
      },
    });
  } else if (userInfo.role === UserRole.ADMIN) {
    profileInfo = await prisma.admin.findUnique({
      where: {
        // email: userInfo.email,
        userId: userInfo.id,
      },
    });
  } else if (userInfo.role === UserRole.BASIC_USER) {
    profileInfo = await prisma.basicUser.findUnique({
      where: {
        // email: userInfo.email,
        userId: userInfo.id,
      },
    });
  }

  return { ...userInfo, ...profileInfo };
};

const updateMyProfile = async (user: IAuthUser, req: Request) => {
  const userInfo = await prisma.user.findUniqueOrThrow({
    where: {
      email: user?.email,
      status: UserStatus.ACTIVE,
    },
  });

  const file = req.file as IFile;
  if (file) {
    const uploadToCloudinary = await fileUploader.uploadToCloudinary(file);
    req.body.profilePhoto = uploadToCloudinary?.secure_url;
  }

  let profileInfo;

  if (userInfo.role === UserRole.SUPER_ADMIN) {
    profileInfo = await prisma.admin.update({
      where: {
        // email: userInfo.email,
        userId: userInfo.id,
      },
      data: req.body,
    });
  } else if (userInfo.role === UserRole.ADMIN) {
    profileInfo = await prisma.admin.update({
      where: {
        // email: userInfo.email,
        userId: userInfo.id,
      },
      data: req.body,
    });
  } else if (userInfo.role === UserRole.BASIC_USER) {
    profileInfo = await prisma.basicUser.update({
      where: {
        // email: userInfo.email,
        userId: userInfo.id,
      },
      data: req.body,
    });
  }

  return { ...profileInfo };
};

// ======================== action on users and admins by super user ======================
const updateUserStatus = async (
  id: string,
  status: string,
  performedById: string
): Promise<User | null> => {
  console.log("Updating user status:", { id, status }); // Debugging step

  // Check if the user exists in the User table
  const existingUser = await prisma.user.findUnique({
    where: { id },
  });

  if (!existingUser) {
    throw new Error("User not found");
  }

  // Normalize status value to match the enum (uppercase)
  const statusFormatted = status?.toUpperCase();

  // Validate status values
  const validStatuses = [
    UserStatus.ACTIVE,
    UserStatus.BLOCKED,
    UserStatus.DELETED,
    UserStatus.PENDING,
  ]; // Enums should be uppercase
  if (!validStatuses.includes(statusFormatted as UserStatus)) {
    throw new Error("Invalid status value");
  }

  // Update the user status
  const updatedUser = await prisma.user.update({
    where: { id },
    data: { status: statusFormatted as UserStatus }, // Cast status as UserStatus enum
  });

  await prisma.userChangeLog.create({
    data: {
      targetUserId: id,
      performedById,
      field: "status",
      oldValue: existingUser.status,
      newValue: statusFormatted,
    },
  });

  return updatedUser;
};

// ======================update user role ====================

// const updateUserRole = async (
//   id: string,
//   role: string,
//   performedById: string
// ): Promise<User | null> => {
//   console.log("Updating user status:", { id, role }); // Debugging step

//   // Check if the user exists in the User table
//   const existingUser = await prisma.user.findUnique({
//     where: { id },
//   });

//   if (!existingUser) {
//     throw new Error("User not found");
//   }

//   // Normalize status value to match the enum (uppercase)
//   const roleFormatted = role?.toUpperCase();

//   // Validate status values
//   const validRoles = [
//     UserRole.BASIC_USER,
//     UserRole.ADMIN,
//     UserRole.SUPER_ADMIN,
//   ]; // Enums should be uppercase
//   if (!validRoles.includes(roleFormatted as UserRole)) {
//     throw new Error("Invalid role value");
//   }

//   if (roleFormatted === UserRole.SUPER_ADMIN) {
//     throw new Error("This action cannot be possible");
//   }
//   // Update the user status
//   const updatedUser = await prisma.user.update({
//     where: { id },
//     data: { role: roleFormatted as UserRole }, // Cast status as UserStatus enum
//   });

//   await prisma.userChangeLog.create({
//     data: {
//       targetUserId: id,
//       performedById,
//       field: "role",
//       oldValue: existingUser.role,
//       newValue: roleFormatted,
//     },
//   });

//   return updatedUser;
// };

const updateUserRole = async (
  id: string,
  role: string,
  performedById: string
): Promise<User | null> => {
  console.log("Updating user role:", { id, role });

  const existingUser = await prisma.user.findUnique({
    where: { id },
    include: {
      admin: true,
      basicUser: true,
    },
  });

  if (!existingUser) {
    throw new Error("User not found");
  }

  const roleFormatted = role?.toUpperCase() as UserRole;

  const validRoles = [
    UserRole.BASIC_USER,
    UserRole.ADMIN,
    UserRole.SUPER_ADMIN,
  ];

  if (!validRoles.includes(roleFormatted)) {
    throw new Error("Invalid role value");
  }

  if (roleFormatted === UserRole.SUPER_ADMIN) {
    throw new Error("This action cannot be possible");
  }

  const result = await prisma.$transaction(async (tx) => {
    // 1. Delete old profile if role is changing
    if (existingUser.role === UserRole.BASIC_USER && existingUser.basicUser) {
      await tx.basicUser.delete({
        // where: { email: existingUser.email },
        where: { userId: id },
      });
    } else if (existingUser.role === UserRole.ADMIN && existingUser.admin) {
      await tx.admin.delete({
        // where: { email: existingUser.email },
        where: { userId: id },
      });
    }

    // 2. Update user role
    const updatedUser = await tx.user.update({
      where: { id },
      data: {
        role: roleFormatted,
        updatedAt: new Date(),
      },
    });

    // 3. Create new profile based on the new role
    const defaultData = {
      // email: existingUser.email,
      userId: id,
      name: existingUser.name || "No name",
      contactNumber: "", // Set sensible defaults or collect from request
      profilePhoto: null,
    };

    if (roleFormatted === UserRole.ADMIN) {
      await tx.admin.create({
        data: {
          ...defaultData,
        },
      });
    } else if (roleFormatted === UserRole.BASIC_USER) {
      await tx.basicUser.create({
        data: {
          ...defaultData,
          address: "", // Add defaults if needed
        },
      });
    }

    // 4. Log the change
    await tx.userChangeLog.create({
      data: {
        targetUserId: id,
        performedById,
        field: "role",
        oldValue: existingUser.role,
        newValue: roleFormatted,
      },
    });

    return updatedUser;
  });

  return result;
};

// ========================action on users by admins  ======================

const updateBasicUserStatus = async (
  id: string,
  status: string,
  performedById: string
): Promise<User | null> => {
  console.log("Updating user status:", { id, status }); // Debugging step

  // Check if the user exists in the User table
  const existingUser = await prisma.user.findUnique({
    where: { id: id, role: UserRole.BASIC_USER },
  });

  if (!existingUser) {
    throw new Error(
      "User not found or you are not authorized to perform this action"
    );
  }

  // Normalize status value to match the enum (uppercase)
  const statusFormatted = status?.toUpperCase();

  // Validate status values
  const validStatuses = [
    UserStatus.ACTIVE,
    UserStatus.BLOCKED,
    UserStatus.DELETED,
    UserStatus.PENDING,
  ]; // Enums should be uppercase
  if (!validStatuses.includes(statusFormatted as UserStatus)) {
    throw new Error("Invalid status value");
  }

  // Update the user status
  const updatedUser = await prisma.user.update({
    where: { id },
    data: { status: statusFormatted as UserStatus }, // Cast status as UserStatus enum
  });

  await prisma.userChangeLog.create({
    data: {
      targetUserId: id,
      performedById,
      field: "status",
      oldValue: existingUser.status,
      newValue: statusFormatted,
    },
  });

  return updatedUser;
};

// ===================================
// This is for if basic user or admin table is empty
// ===================================

const deleteUser = async (id: string) => {
  const user = await prisma.user.findUnique({
    where: { id },
    include: {
      admin: true,
      basicUser: true,
    },
  });

  if (!user) {
    throw new Error("User not found");
  }

  await prisma.$transaction(async (tx) => {
    // Delete related profile depending on role
    if (user.role === UserRole.ADMIN && user.admin) {
      await tx.admin.delete({
        where: { id: user.admin.id },
      });
    }

    if (user.role === UserRole.BASIC_USER && user.basicUser) {
      await tx.basicUser.delete({
        where: { id: user.basicUser.id },
      });
    }

    // Finally, delete the user
    await tx.user.delete({
      where: { id },
    });
  });

  return { message: "User deleted successfully" };
};

export const userService = {
  createAdmin,
  createBasicUser,
  getAllFromDB,
  changeProfileStatus,
  getMyProfile,
  updateMyProfile,
  updateUserStatus,
  updateBasicUserStatus,
  updateUserRole,
  deleteUser,
};

import { UserRole, UserStatus } from "@prisma/client";
import { z } from "zod";

const createAdmin = z.object({
  password: z.string({
    required_error: "Password is required",
  }),
  admin: z.object({
    name: z.string({
      required_error: "Name is required!",
    }),
    email: z.string({
      required_error: "Email is required!",
    }),
    // contactNumber: z.string({
    //   required_error: "Contact Number is required!",
    // }),
  }),
});

const createBasicUser = z.object({
  password: z.string(),
  basicUser: z.object({
    email: z
      .string({
        required_error: "Email is required!",
      })
      .email(),
    name: z.string({
      required_error: "Name is required!",
    }),
    // contactNumber: z.string({
    //   required_error: "Contact number is required!",
    // }),
    // address: z.string({
    //   required_error: "Address is required",
    // }),
  }),
});

const updateStatus = z.object({
  body: z.object({
    status: z.enum([UserStatus.ACTIVE, UserStatus.BLOCKED, UserStatus.DELETED]),
  }),
});

export const userValidation = {
  createAdmin,
  createBasicUser,
  updateStatus,
};

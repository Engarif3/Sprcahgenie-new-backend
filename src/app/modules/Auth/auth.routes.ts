import express from "express";
import { AuthController } from "./auth.controller";
import auth from "../../middlewares/auth";
import { UserRole } from "@prisma/client";

const router = express.Router();

router.post("/login", AuthController.loginUser);

// to get user info from access token
router.get(
  "/my-info",
  auth(UserRole.SUPER_ADMIN, UserRole.ADMIN, UserRole.BASIC_USER),
  AuthController.getCurrentUser
);

router.post("/refresh-token", AuthController.refreshToken);

router.post(
  "/change-password",
  auth(UserRole.SUPER_ADMIN, UserRole.ADMIN, UserRole.BASIC_USER),
  AuthController.changePassword
);

router.post("/forgot-password", AuthController.forgotPassword);

router.post("/reset-password", AuthController.resetPassword);

router.post("/resend-verification", AuthController.resendVerificationEmail);

export const AuthRoutes = router;

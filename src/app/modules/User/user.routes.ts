import express, { NextFunction, Request, Response } from "express";
import { userController } from "./user.controller";
import auth from "../../middlewares/auth";
import { UserRole } from "@prisma/client";
import { fileUploader } from "../../../helpers/fileUploader";
import { userValidation } from "./user.validation";
import validateRequest from "../../middlewares/validateRequest";

const router = express.Router();

router.get(
  "/",
  auth(UserRole.SUPER_ADMIN, UserRole.ADMIN),
  userController.getAllFromDB
);

router.get(
  "/me",
  auth(UserRole.SUPER_ADMIN, UserRole.ADMIN, UserRole.BASIC_USER),
  userController.getMyProfile
);

router.post(
  "/create-admin",
  auth(UserRole.SUPER_ADMIN, UserRole.ADMIN),
  fileUploader.upload.single("file"),
  (req: Request, res: Response, next: NextFunction) => {
    req.body = userValidation.createAdmin.parse(JSON.parse(req.body.data));
    return userController.createAdmin(req, res, next);
  }
);

// ===================================
// This is for if basic user or admin table is empty
// ===================================
router.delete("/delete-any-user/:id", userController.deleteUser);

router.post(
  "/register-basicUser",
  fileUploader.upload.single("file"),
  (req: Request, res: Response, next: NextFunction) => {
    req.body = userValidation.createBasicUser.parse(JSON.parse(req.body.data));
    return userController.createBasicUser(req, res, next);
  }
);

router.patch(
  "/:id/status",
  auth(UserRole.SUPER_ADMIN, UserRole.ADMIN),
  validateRequest(userValidation.updateStatus),
  userController.changeProfileStatus
);

router.patch(
  "/update-my-profile",
  auth(UserRole.SUPER_ADMIN, UserRole.ADMIN, UserRole.BASIC_USER),
  fileUploader.upload.single("file"),
  (req: Request, res: Response, next: NextFunction) => {
    req.body = JSON.parse(req.body.data);
    return userController.updateMyProfile(req, res, next);
  }
);

// updater user status like: blocked, pending
router.patch(
  "/update-status/:id",
  auth(UserRole.SUPER_ADMIN, UserRole.ADMIN),
  userController.updateUserStatus
);

// update user role to admin,user
router.patch(
  "/update-role/:id",
  auth(UserRole.SUPER_ADMIN, UserRole.ADMIN),
  userController.updateUserRole
);

//set admin middleware here
router.patch(
  "/update-basicUser-status/:id",
  auth(UserRole.ADMIN),
  userController.updateBasicUserStatus
);
// =============================
router.get("/verify-email", userController.verifyUserEmail);

// =====================================
export const userRoutes = router;

import express from "express";
import { BasicUserController } from "./basicUser.controller";

const router = express.Router();

router.get("/", BasicUserController.getAllFromDB);

router.get("/:id", BasicUserController.getByIdFromDB);

router.patch("/:id", BasicUserController.updateIntoDB);

//delete use for forever
router.delete("/:id", BasicUserController.deleteFromDB);

//this is for when user wants to delete his/her id
router.delete("/soft/:id", BasicUserController.softDelete);

export const BasicUserRoutes = router;

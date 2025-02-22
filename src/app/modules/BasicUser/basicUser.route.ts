import express from "express";
import { BasicUserController } from "./basicUser.controller";

const router = express.Router();

router.get("/", BasicUserController.getAllFromDB);

router.get("/:id", BasicUserController.getByIdFromDB);

router.patch("/:id", BasicUserController.updateIntoDB);

router.delete("/:id", BasicUserController.deleteFromDB);
router.delete("/soft/:id", BasicUserController.softDelete);

export const BasicUserRoutes = router;

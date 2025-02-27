import express from "express";
import { levelController } from "./level.controller";

const router = express.Router();

// Routes for Level
router.post("/create", levelController.createLevelController);
router.get("/all", levelController.getAllLevelsController);
router.get("/:levelId", levelController.getLevelController);
router.put("/update/:levelId", levelController.updateLevelController);
router.delete("/delete/:levelId", levelController.deleteLevelController);

export const levelRoutes = router;

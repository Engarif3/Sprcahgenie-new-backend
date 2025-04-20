import express from "express";
import { wordController } from "./word.controller";
import auth from "../../../middlewares/auth";
import { UserRole } from "@prisma/client";

const router = express.Router();

// Route to create a word
router.post(
  "/create",
  //   auth(UserRole.SUPER_ADMIN, UserRole.ADMIN),
  wordController.createWordController
);
router.get("/all", wordController.getWordsList);
router.get("/:idOrValue", wordController.getSingleWordController);
router.put("/update/:id", wordController.updateWordController);
router.delete("/delete/:id", wordController.deleteWordController);
router.delete("/delete-all-words", wordController.deleteAllWordsController);

export const wordRoutes = router;

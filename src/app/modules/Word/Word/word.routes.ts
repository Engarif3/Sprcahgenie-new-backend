import express from "express";
import { wordController } from "./word.controller";

const router = express.Router();

// Route to create a word
router.post("/create", wordController.createWordController);
router.get("/all", wordController.getWordsList);
// router.get("/:idOrValue", wordController.getSingleWordController);
router.put("/update/:id", wordController.updateWordController);
router.delete("/delete/:id", wordController.deleteWordController);
router.delete("/delete-all-words", wordController.deleteAllWordsController);

export const wordRoutes = router;

import express from "express";
import { topicController } from "./topic.controller";

const router = express.Router();

// Topic Routes
router.post("/create", topicController.createTopic);
router.get("/all", topicController.getAllTopics);
router.get("/:topicId", topicController.getTopic);
router.put("/update/:topicId", topicController.updateTopic);
router.delete("/delete/:topicId", topicController.deleteTopic);

export const topicRoutes = router;

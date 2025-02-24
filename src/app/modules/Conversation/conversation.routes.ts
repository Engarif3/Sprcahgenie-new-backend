import express from "express";
import { conversationController } from "./conversation.controller";

const router = express.Router();

router.post("/create", conversationController.createConversation);
router.get("/all", conversationController.getAllConversations);
router.get("/:conversationId", conversationController.getConversation);

router.put(
  "/update/:conversationId",
  conversationController.updateConversation
);
router.delete(
  "/delete/:conversationId",
  conversationController.deleteConversation
);

export const conversationRoutes = router;

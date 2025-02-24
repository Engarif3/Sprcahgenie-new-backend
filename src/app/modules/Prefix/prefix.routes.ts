import express from "express";
import { prefixController } from "./prefix.controller";

const router = express.Router();

// PrefixType Routes
router.post("/type-create", prefixController.createPrefixType);
router.get("/prefix-types", prefixController.getAllPrefixTypes);
router.get("/prefix-type/:prefixTypeId", prefixController.getPrefixType);

// Prefix Routes
router.post("/create", prefixController.createPrefix);
router.get("/all", prefixController.getAllPrefixes);
router.get("/:prefixId", prefixController.getPrefix);
router.patch("/update/:prefixId", prefixController.updatePrefix);
router.delete("/delete/:prefixId", prefixController.deletePrefix);

export const prefixRoutes = router;

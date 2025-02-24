import express from "express";
import { userRoutes } from "../modules/User/user.routes";
import { AdminRoutes } from "../modules/Admin/admin.routes";
import { AuthRoutes } from "../modules/Auth/auth.routes";

import { MetaRoutes } from "../modules/Meta/meta.routes";
import { BasicUserRoutes } from "../modules/BasicUser/basicUser.route";

const router = express.Router();

// =======================

import {
  createLevel,
  createWord,
  importWordsFromJson,
} from "../../prisma/scripts/create";
import {
  deleteAllWords,
  deleteLevel,
  deleteWord,
} from "../../prisma/scripts/delete";
import { getSingleWord } from "../../prisma/scripts/getSingleItem";
import {
  getArticles,
  getLevels,
  getPartsOfSpeech,
  getTopics,
  getWordsList,
  suggestWords,
} from "../../prisma/scripts/get";
import { wordQuery } from "../../prisma/scripts/query";
import {
  updateArticle,
  updateLevel,
  upDatePartsOfSpeech,
  updateTopic,
  updateWord,
} from "../../prisma/scripts/update";
import {
  checkDuplicates,
  countJsonEntries,
  validateFields,
} from "../../dataToDb/countJsonEntry";
import {
  addFavoriteWord,
  getFavoriteWords,
  removeFavoriteWord,
} from "../modules/Favourite/favorite.controller";
import { conversationRoutes } from "../modules/Conversation/conversation.routes";
import { prefixRoutes } from "../modules/Prefix/prefix.routes";
import { insertPrefixesFromJson } from "../../dataToDb/InsertPrefix";
// =======================

const moduleRoutes = [
  {
    path: "/user",
    route: userRoutes,
  },
  {
    path: "/admin",
    route: AdminRoutes,
  },
  {
    path: "/auth",
    route: AuthRoutes,
  },

  {
    path: "/basicUser",
    route: BasicUserRoutes,
  },
  {
    path: "/meta",
    route: MetaRoutes,
  },
  {
    path: "/conversation",
    route: conversationRoutes,
  },
  {
    path: "/prefix",
    route: prefixRoutes,
  },
];

// ==============================
router.post("/levels", createLevel);

// Endpoint to insert Topic data
router.post("/topics", updateTopic);

// Endpoint to insert Article data
router.post("/articles", updateArticle);

// Endpoint to insert PartOfSpeech data
router.post("/part-of-speech", upDatePartsOfSpeech);

// Endpoint to insert data into the Word table
router.post("/words", createWord);
router.put("/update-word/:id", updateWord);

//insert data to db
router.post("/insert", importWordsFromJson);
router.get("/count", countJsonEntries);
router.get("/check", checkDuplicates);
router.get("/validity", validateFields);
router.post("/insert-prefixes", insertPrefixesFromJson);

// Endpoint to fetch all Level data
router.get("/levels", getLevels);

// Endpoint to fetch all Topic data
router.get("/topics", getTopics);

// Endpoint to fetch all Article data
router.get("/articles", getArticles);

// Endpoint to fetch all PartOfSpeech data
router.get("/part-of-speech", getPartsOfSpeech);

// Endpoint to fetch all Word data
router.get("/words", getWordsList);
// Endpoint to fetch all Word data
router.get("/suggest/:query", suggestWords);

//query
// http://localhost:3000/words/suggestions?query=lest&type=synonyms
router.get("/words/suggestions", wordQuery);

// update
router.put("/levels/:id", updateLevel);

// delete
router.delete("/levels/:id", deleteLevel);
router.delete("/word/:wordId", deleteWord);

// fetch by id
router.get("/words/:idOrValue", getSingleWord);

//delete all words
router.delete("/delete-all-words", deleteAllWords);

// Favorite Words Routes
router.post("/favorite-words", addFavoriteWord);
router.delete("/favorite-words/:wordId", removeFavoriteWord);
router.get("/favorite-words/:userId", getFavoriteWords);
// ==============================

moduleRoutes.forEach((route) => router.use(route.path, route.route));

export default router;

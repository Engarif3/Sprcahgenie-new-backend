/*
  Warnings:

  - You are about to drop the `companies` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "companies" DROP CONSTRAINT "companies_email_fkey";

-- DropTable
DROP TABLE "companies";

-- CreateTable
CREATE TABLE "basic_users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "profilePhoto" TEXT,
    "contactNumber" TEXT,
    "address" TEXT,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "basic_users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "favorite_words" (
    "userId" TEXT NOT NULL,
    "wordId" INTEGER NOT NULL,

    CONSTRAINT "favorite_words_pkey" PRIMARY KEY ("userId","wordId")
);

-- CreateTable
CREATE TABLE "words_table" (
    "id" SERIAL NOT NULL,
    "value" TEXT NOT NULL,
    "meaning" TEXT[],
    "sentences" TEXT[],
    "levelId" INTEGER,
    "topicId" INTEGER,
    "articleId" INTEGER,
    "partOfSpeechId" INTEGER,
    "pluralForm" TEXT,

    CONSTRAINT "words_table_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "levels" (
    "id" SERIAL NOT NULL,
    "level" TEXT NOT NULL,
    "deletedAt" TIMESTAMPTZ,

    CONSTRAINT "levels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "topics" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "topics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "articles" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "articles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parts_of_speech" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "parts_of_speech_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_SynonymRelation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_SynonymRelation_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_AntonymRelation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_AntonymRelation_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_SimilarWordRelation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_SimilarWordRelation_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "basic_users_id_key" ON "basic_users"("id");

-- CreateIndex
CREATE UNIQUE INDEX "basic_users_email_key" ON "basic_users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "words_table_value_key" ON "words_table"("value");

-- CreateIndex
CREATE UNIQUE INDEX "levels_level_key" ON "levels"("level");

-- CreateIndex
CREATE UNIQUE INDEX "topics_name_key" ON "topics"("name");

-- CreateIndex
CREATE UNIQUE INDEX "articles_name_key" ON "articles"("name");

-- CreateIndex
CREATE UNIQUE INDEX "parts_of_speech_name_key" ON "parts_of_speech"("name");

-- CreateIndex
CREATE INDEX "_SynonymRelation_B_index" ON "_SynonymRelation"("B");

-- CreateIndex
CREATE INDEX "_AntonymRelation_B_index" ON "_AntonymRelation"("B");

-- CreateIndex
CREATE INDEX "_SimilarWordRelation_B_index" ON "_SimilarWordRelation"("B");

-- AddForeignKey
ALTER TABLE "basic_users" ADD CONSTRAINT "basic_users_email_fkey" FOREIGN KEY ("email") REFERENCES "users"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "favorite_words" ADD CONSTRAINT "favorite_words_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "favorite_words" ADD CONSTRAINT "favorite_words_wordId_fkey" FOREIGN KEY ("wordId") REFERENCES "words_table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "words_table" ADD CONSTRAINT "fk_word_level" FOREIGN KEY ("levelId") REFERENCES "levels"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "words_table" ADD CONSTRAINT "fk_word_topic" FOREIGN KEY ("topicId") REFERENCES "topics"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "words_table" ADD CONSTRAINT "fk_word_article" FOREIGN KEY ("articleId") REFERENCES "articles"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "words_table" ADD CONSTRAINT "fk_word_part_of_speech" FOREIGN KEY ("partOfSpeechId") REFERENCES "parts_of_speech"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SynonymRelation" ADD CONSTRAINT "_SynonymRelation_A_fkey" FOREIGN KEY ("A") REFERENCES "words_table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SynonymRelation" ADD CONSTRAINT "_SynonymRelation_B_fkey" FOREIGN KEY ("B") REFERENCES "words_table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AntonymRelation" ADD CONSTRAINT "_AntonymRelation_A_fkey" FOREIGN KEY ("A") REFERENCES "words_table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AntonymRelation" ADD CONSTRAINT "_AntonymRelation_B_fkey" FOREIGN KEY ("B") REFERENCES "words_table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SimilarWordRelation" ADD CONSTRAINT "_SimilarWordRelation_A_fkey" FOREIGN KEY ("A") REFERENCES "words_table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SimilarWordRelation" ADD CONSTRAINT "_SimilarWordRelation_B_fkey" FOREIGN KEY ("B") REFERENCES "words_table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

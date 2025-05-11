/*
  Warnings:

  - You are about to drop the column `modifiedBy` on the `word_history` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "word_history" DROP COLUMN "modifiedBy",
ALTER COLUMN "value" DROP NOT NULL,
ALTER COLUMN "oldData" DROP NOT NULL,
ALTER COLUMN "pluralForm" DROP NOT NULL;

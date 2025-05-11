/*
  Warnings:

  - Added the required column `newData` to the `word_history` table without a default value. This is not possible if the table is not empty.
  - Added the required column `oldData` to the `word_history` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "word_history" ADD COLUMN     "newData" JSONB NOT NULL,
ADD COLUMN     "oldData" JSONB NOT NULL;

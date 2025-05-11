/*
  Warnings:

  - Added the required column `modifiedBy` to the `word_history` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "word_history" ADD COLUMN     "modifiedBy" TEXT NOT NULL;

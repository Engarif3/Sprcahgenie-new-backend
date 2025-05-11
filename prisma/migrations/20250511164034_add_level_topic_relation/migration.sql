/*
  Warnings:

  - Added the required column `pluralForm` to the `word_history` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "word_history" ADD COLUMN     "pluralForm" TEXT NOT NULL;

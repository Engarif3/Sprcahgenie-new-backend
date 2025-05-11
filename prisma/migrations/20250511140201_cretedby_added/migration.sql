/*
  Warnings:

  - Added the required column `createdBy` to the `words_table` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "words_table" ADD COLUMN     "createdBy" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "words_table" ADD CONSTRAINT "words_table_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

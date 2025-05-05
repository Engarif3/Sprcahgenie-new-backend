/*
  Warnings:

  - Added the required column `levelId` to the `topics` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "topics" ADD COLUMN     "levelId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "topics" ADD CONSTRAINT "topics_levelId_fkey" FOREIGN KEY ("levelId") REFERENCES "levels"("id") ON DELETE CASCADE ON UPDATE CASCADE;

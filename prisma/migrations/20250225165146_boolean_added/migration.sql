/*
  Warnings:

  - A unique constraint covering the columns `[prefixWord]` on the table `prefixes` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `verb` to the `prefixes` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "prefixes" ADD COLUMN     "verb" BOOLEAN NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "prefixes_prefixWord_key" ON "prefixes"("prefixWord");

/*
  Warnings:

  - You are about to drop the column `wordWithoutPrefix` on the `prefixes` table. All the data in the column will be lost.
  - Added the required column `prefixWord` to the `prefixes` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "prefixes" DROP COLUMN "wordWithoutPrefix",
ADD COLUMN     "prefixWord" TEXT NOT NULL;

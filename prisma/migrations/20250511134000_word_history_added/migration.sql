-- CreateTable
CREATE TABLE "word_history" (
    "id" SERIAL NOT NULL,
    "wordId" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "meaning" TEXT[],
    "sentences" TEXT[],
    "modifiedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modifiedFields" TEXT[],

    CONSTRAINT "word_history_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "word_history" ADD CONSTRAINT "word_history_wordId_fkey" FOREIGN KEY ("wordId") REFERENCES "words_table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "word_history" ADD CONSTRAINT "word_history_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

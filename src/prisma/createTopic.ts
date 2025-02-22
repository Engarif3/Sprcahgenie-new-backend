import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  const topics = [
    "Grammar",
    "Vocabulary",
    "Sentences",
    "Verbs",
    "Adjectives",
    "Prepositions",
  ];

  for (const topicName of topics) {
    // Check if the topic already exists
    const existingTopic = await prisma.topic.findUnique({
      where: { name: topicName },
    });

    if (!existingTopic) {
      // Insert the topic if it doesn't exist
      await prisma.topic.create({
        data: {
          name: topicName,
        },
      });
      console.log(`Inserted topic: ${topicName}`);
    } else {
      console.log(`Topic ${topicName} already exists.`);
    }
  }
}

main()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  const levels = ["A1", "A2", "B1", "B2", "C1", "C2"];

  for (const level of levels) {
    // Check if the level already exists
    const existingLevel = await prisma.level.findUnique({
      where: { level: level },
    });

    // If it doesn't exist, create the level
    if (!existingLevel) {
      await prisma.level.create({
        data: {
          level: level,
        },
      });
      console.log(`Inserted level: ${level}`);
    } else {
      console.log(`Level ${level} already exists.`);
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

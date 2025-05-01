import { Router } from "express";
import prisma from "./shared/prisma";
import { subHours } from "date-fns";

const router = Router();

// Function to delete pending users (can be called manually via API)
const deletePendingUsers = async () => {
  console.log(
    "Running cron job to delete pending users created 24 hours ago..."
  );

  try {
    const twentyFourHoursAgo = subHours(new Date(), 24);

    const pendingUsers = await prisma.user.findMany({
      where: {
        status: "PENDING",
        createdAt: {
          lt: twentyFourHoursAgo, // Users created more than 24 hours ago
        },
      },
      include: {
        admin: true,
        basicUser: true,
      },
    });

    console.log("Pending users found:", pendingUsers);

    // Delete Admin and BasicUser records first to avoid foreign key constraint issues
    const deletedAdmins = await prisma.admin.deleteMany({
      where: {
        user: {
          status: "PENDING",
          createdAt: {
            lt: twentyFourHoursAgo,
          },
        },
      },
    });

    const deletedBasicUsers = await prisma.basicUser.deleteMany({
      where: {
        user: {
          status: "PENDING",
          createdAt: {
            lt: twentyFourHoursAgo,
          },
        },
      },
    });

    // Now delete the user records
    const deletedUsers = await prisma.user.deleteMany({
      where: {
        status: "PENDING",
        createdAt: {
          lt: twentyFourHoursAgo,
        },
      },
    });

    console.log(`Deleted ${deletedAdmins.count} admin(s)`);
    console.log(`Deleted ${deletedBasicUsers.count} basic user(s)`);
    console.log(`Deleted ${deletedUsers.count} user(s)`);
  } catch (error) {
    console.error("Error deleting pending users:", error);
  } finally {
    await prisma.$disconnect();
  }
};

// Express route to manually trigger cron job via API
export const cronJob = async (req: any, res: any) => {
  try {
    await deletePendingUsers();
    res.json({ message: "Cron job executed successfully" });
  } catch (error) {
    console.error("Cron job error:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Schedule the cron job to run daily at midnight
// cron.schedule("0 0 * * *", deletePendingUsers);

// console.log("Cron job scheduled to run every midnight...");

// ****************https://www.easycron.com/cron-jobs*******************

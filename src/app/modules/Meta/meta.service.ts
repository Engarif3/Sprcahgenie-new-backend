import { UserRole } from "@prisma/client";
import { IAuthUser } from "../../interfaces/common";
import ApiError from "../../errors/ApiError";
import prisma from "../../../shared/prisma";

const fetchDashboardMetaData = async (user: IAuthUser) => {
  let metaData;
  switch (user?.role) {
    case UserRole.SUPER_ADMIN:
      metaData = getSuperAdminMetaData();
      break;
    case UserRole.ADMIN:
      metaData = getAdminMetaData();
      break;
    case UserRole.BASIC_USER:
      metaData = getBasicUserMetaData(user);
      break;
    default:
      throw new Error("Invalid user role!");
  }

  return metaData;
};

const getSuperAdminMetaData = async () => {
  const basicUserCount = await prisma.basicUser.count();

  const adminCount = await prisma.admin.count();

  return {
    basicUserCount,
    adminCount,
  };
};

const getAdminMetaData = async () => {
  const basicUserCount = await prisma.basicUser.count();

  return {
    basicUserCount,
  };
};

const getBasicUserMetaData = async (user: IAuthUser) => {
  const basicUserData = await prisma.basicUser.findUniqueOrThrow({
    where: {
      email: user?.email,
    },
  });

  return {
    basicUserData,
  };
};

export const MetaService = {
  fetchDashboardMetaData,
};

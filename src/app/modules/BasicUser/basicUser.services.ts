import { BasicUser, Prisma, UserStatus } from "@prisma/client";
import prisma from "../../../shared/prisma";
import {
  IBasicUserFilterRequest,
  IBasicUserUpdate,
} from "./basicUser.interface";
import { IPaginationOptions } from "../../interfaces/pagination";
import { paginationHelper } from "../../../helpers/paginationHelper";
import { basicUserSearchableFields } from "./basicUser.constants";

const getAllFromDB = async (
  filters: IBasicUserFilterRequest,
  options: IPaginationOptions
) => {
  const { limit, page, skip } = paginationHelper.calculatePagination(options);
  const { searchTerm, ...filterData } = filters;

  const andConditions = [];

  if (searchTerm) {
    andConditions.push({
      OR: basicUserSearchableFields.map((field) => ({
        [field]: {
          contains: searchTerm,
          mode: "insensitive",
        },
      })),
    });
  }

  if (Object.keys(filterData).length > 0) {
    andConditions.push({
      AND: Object.keys(filterData).map((key) => {
        return {
          [key]: {
            equals: (filterData as any)[key],
          },
        };
      }),
    });
  }
  andConditions.push({
    isDeleted: false,
  });

  const whereConditions: Prisma.BasicUserWhereInput =
    andConditions.length > 0 ? { AND: andConditions } : {};

  const result = await prisma.basicUser.findMany({
    where: whereConditions,
    skip,
    take: limit,
    orderBy:
      options.sortBy && options.sortOrder
        ? { [options.sortBy]: options.sortOrder }
        : {
            createdAt: "desc",
          },
    include: {
      user: { select: { id: true, name: true, status: true, role: true } },
    },
  });
  const total = await prisma.basicUser.count({
    where: whereConditions,
  });

  return {
    meta: {
      total,
      page,
      limit,
    },
    data: result,
  };
};

const getByIdFromDB = async (id: string): Promise<BasicUser | null> => {
  const result = await prisma.basicUser.findUnique({
    where: {
      id,
      isDeleted: false,
    },
  });
  return result;
};

const updateIntoDB = async (
  id: string,
  payload: Partial<IBasicUserUpdate>
): Promise<BasicUser | null> => {
  const { ...basicUserData } = payload;

  const basicUserInfo = await prisma.basicUser.findUniqueOrThrow({
    where: {
      id,
      isDeleted: false,
    },
  });

  await prisma.$transaction(async (transactionClient) => {
    //update basicUserdata
    await transactionClient.basicUser.update({
      where: {
        id,
      },
      data: basicUserData,
    });
  });

  const responseData = await prisma.basicUser.findUnique({
    where: {
      id: basicUserInfo.id,
    },
  });
  return responseData;
};

const deleteFromDB = async (id: string): Promise<BasicUser | null> => {
  const existingUser = await prisma.basicUser.findUnique({
    where: { id },
  });

  if (!existingUser) {
    throw new Error("User not found");
  }

  const result = await prisma.$transaction(async (tx) => {
    const deletedBasicUser = await tx.basicUser.delete({
      where: {
        id,
      },
    });

    await tx.user.delete({
      where: {
        // email: deletedBasicUser.email,
        id: deletedBasicUser.userId,
      },
    });

    return deletedBasicUser;
  });

  return result;
};

const softDelete = async (id: string): Promise<BasicUser | null> => {
  return await prisma.$transaction(async (transactionClient) => {
    const deletedBasicUser = await transactionClient.basicUser.update({
      where: { id },
      data: {
        isDeleted: true,
      },
    });

    await transactionClient.user.update({
      where: {
        // email: deletedBasicUser.email,
        id: deletedBasicUser.userId,
      },
      data: {
        status: UserStatus.DELETED,
      },
    });

    return deletedBasicUser;
  });
};

export const BasicUserService = {
  getAllFromDB,
  getByIdFromDB,
  updateIntoDB,
  deleteFromDB,
  softDelete,
};

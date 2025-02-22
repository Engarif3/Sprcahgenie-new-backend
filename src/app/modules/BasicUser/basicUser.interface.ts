export type IBasicUserFilterRequest = {
  searchTerm?: string | undefined;
  email?: string | undefined;
  contactNo?: string | undefined;
};

export type IBasicUserUpdate = {
  name: string;
  contactNumber: string;
  address: string;
};

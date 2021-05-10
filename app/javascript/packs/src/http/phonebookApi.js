import { $authHost } from "./client";

export const getPhonebookApi = async () => {
  const response = await $authHost.get("api/v1/phonebooks");
  return response;
};

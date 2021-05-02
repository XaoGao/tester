import { $host, $authHost } from "./client";

export const createSession = async (login, password) => {
  const response = await $host.post("api/v1/login", {
    login: login,
    password: password,
  });
  return response;
};

export const createUser = async (
  firstName,
  lastName,
  middleName,
  login,
  password,
  role
) => {
  const response = await $host.post("api/v1/registration", { 
    login: login, 
    password: password, 
    first_name: firstName, 
    last_name: lastName, 
    middle_name: middleName,
    role: role 
  });
    return response;
};

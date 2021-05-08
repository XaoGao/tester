import { $host, $authHost } from './client'

export const getAllDepartmentsApi = () => {
  const response = $authHost.get('api/v1/departments');
  return response;
}
export const updateDepartmentApi = async (id, name, sortLevel, lock) => {
  const response = await $authHost.put(`api/v1/departments/${id}`, {name: name, sortLevel: sortLevel, lock: lock});
  return response;
}
export const createDepartmentApi = async (name, sortLevel, lock) => {
  const response = await $authHost.post(`api/v1/departments`, {name: name, sortLevel: sortLevel, lock: lock});
  return response;
}
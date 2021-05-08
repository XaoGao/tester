import { $host, $authHost } from './client'

export const getAllPositionsApi = async () => {
  const response = await $authHost.get('api/v1/positions');
  return response;
}
export const updatePositionApi = async (id, name, sortLevel, lock) => {
  const response = await $authHost.put(`api/v1/positions/${id}`, {name: name, sortLevel: sortLevel, lock: lock});
  return response;
}
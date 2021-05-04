import { $host, $authHost } from './client'

export const getAllPositions = async () => {
  const response = await $authHost.get('api/v1/positions');
  return response;
}
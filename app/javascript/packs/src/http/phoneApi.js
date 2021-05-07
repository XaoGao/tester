import { $host, $authHost } from './client'

export const getAllPhones = () => {
  const response = $authHost.get('api/v1/phones');
  return response;
}
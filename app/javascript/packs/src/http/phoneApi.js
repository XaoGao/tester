import { $host, $authHost } from './client'

export const getAllPhonesApi = () => {
  const response = $authHost.get('api/v1/phones');
  return response;
}
export const updatePhoneApi = (id, number) => {
  const response = $authHost.put(`api/v1/phones/${id}`, { number: number});
  return response;
}
export const createPhoneApi = (number) => {
  const response = $authHost.post(`api/v1/phones`, { number: number});
  return response;
}
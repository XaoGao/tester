import { $host, $authHost } from './client'

export const getAllDepartments = () => {
  const response = $authHost.get('api/v1/departments');
  return response;
}
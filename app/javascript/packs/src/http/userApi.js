import { $host, $authHost } from './client'

export const call = async (login, password) => {
  const response = await $host.post('api/v1/login', { login: login, password: password })
  return response
}
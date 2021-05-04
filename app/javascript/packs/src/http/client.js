import axios from 'axios'

const baseUrl = 'http://localhost:3000'

const $host = axios.create({
  baseURL: baseUrl
})

const $authHost = axios.create({
  baseURL: baseUrl
})

const authInterceptor = (config) => {
  const token = localStorage.getItem('token');
  console.log(token);
  config.headers.authorization = `Bearer ${token}`
  return config;
}

$authHost.interceptors.request.use(authInterceptor)

export {
  $host,
  $authHost
}
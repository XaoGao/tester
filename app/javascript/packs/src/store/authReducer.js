import { createSession, createUser } from '../http/userApi'
import jwt_decode from "jwt-decode";

const SET_CURRENT_USER = 'auth/SET_CURRENT_USER'

const initialState = {
  isAuth: false,
  fullName: '',
  role: 0
}

const authReducer = (state = initialState, action) => {
  switch (action.type) {
    case SET_CURRENT_USER:
      return {
        ...state,
        ...action.payload
      }
    default:
      return state
  }
}

export default authReducer;

export const setCurrentUser = (isAuth, fullName, role) => ({
  type: SET_CURRENT_USER,
  payload: { isAuth, fullName,role } 
})

export const signin = (login, password) => async (dispatch) => { 
  return await createSession(login, password)
  .then((response) => {
    if(response.status === 200)
    {
      if(response?.data?.token)
      {
        var decoded = jwt_decode(response.data.token);
        localStorage.setItem('token', response.data.token)      
        dispatch(setCurrentUser(true, decoded.fullName, decoded.role));
      }
    }
  })
  .catch((error) => {
    let er = error.response.data.error
      ? error.response.data.error
      : "Непредвиденная ошибка";
    throw Error(er);
  })
}
export const logout = () => async (dispatch) => {
  localStorage.removeItem('token');
  dispatch(setCurrentUser(false, '', 0));
}
export const signup = (firstName, lastName, middleName, login, password) => async (dispatch) => {
  return await createUser(firstName, lastName, middleName, login, password, 'doctor')
  .then((response) => {
    if (response.status === 204) {
      signin(login, password);
    }
  })
}
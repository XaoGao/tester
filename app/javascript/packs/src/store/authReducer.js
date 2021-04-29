import { call } from '../http/userApi'
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
      console.log(action.payload)
      return {
        ...state,
        ...action.payload
      }
    default:
      return state
  }
}

export default authReducer;

const setCurrentUser = (isAuth, fullName) => ({
  type: SET_CURRENT_USER,
  payload: { isAuth, fullName } 
})

export const signup = (login, password) => async (dispatch) => { 
  return await call(login, password).then((response) => {
    if(response?.data?.token)
    {
      var decoded = jwt_decode(response.data.token);
      dispatch(setCurrentUser(true, decoded.fullName, decoded.role));
    }
  })
}

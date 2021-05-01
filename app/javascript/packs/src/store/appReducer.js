import jwt_decode from "jwt-decode";
import { setCurrentUser } from './authReducer'
const SET_APP_STATE = 'app/SET_APP_STATE'

const initialStore = {
  init: false
}

const appReducer = (state = initialStore, action) => {
  switch (action.type) {
    case SET_APP_STATE:
      return {
        ...state,
        ...action.payload
      }
    default:
      return state
  }
}

export default appReducer;


const setAppState = (appState) => ({
  type: SET_APP_STATE,
  payload: { init: appState }
})

export const initialApp = () => (dispatch) => {
  const token = localStorage.getItem('token')
  if (token) {
    const decoded = jwt_decode(token)
    const now = new Date();
    let nowUtc = new Date(now.toString()).getTime() / 1000;
    if (nowUtc < decoded.exp + 4 * 3600) {
      dispatch(setCurrentUser(true, decoded.fullName, decoded.role));
    }
    else
    {
      localStorage.removeItem('token')
    }
  }
  setAppState(true);
}
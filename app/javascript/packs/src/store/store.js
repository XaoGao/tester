import { combineReducers, createStore, applyMiddleware } from "redux";
import authReducer from "./authReducer";
import { composeWithDevTools } from 'redux-devtools-extension'
import thunk from 'redux-thunk';
import appReducer from "./appReducer";

const reducers = combineReducers({
  auth: authReducer,
  app: appReducer
})

const store = createStore(reducers, composeWithDevTools(applyMiddleware(thunk)));

export default store;
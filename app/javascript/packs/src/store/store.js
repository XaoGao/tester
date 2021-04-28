import { combineReducers, createStore, applyMiddleware } from "redux";
import authReducer from "./authReducer";
import { composeWithDevTools } from 'redux-devtools-extension'
import thunk from 'redux-thunk';

const reducers = combineReducers({
  auth: authReducer
})

const store = createStore(reducers, composeWithDevTools(applyMiddleware(thunk)));

export default store;
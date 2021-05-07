import { combineReducers, createStore, applyMiddleware } from "redux";
import { composeWithDevTools } from 'redux-devtools-extension'
import thunk from 'redux-thunk';
import authReducer from "./authReducer";
import appReducer from "./appReducer";
import positionReducer from "./positionReducer";
import phoneReducer from "./phoneReducer";
import departmentReducer from "./departmentReducer";

const reducers = combineReducers({
  auth: authReducer,
  app: appReducer,
  position: positionReducer,
  phone: phoneReducer,
  department: departmentReducer
})

const store = createStore(reducers, composeWithDevTools(applyMiddleware(thunk)));

export default store;
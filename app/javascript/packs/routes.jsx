import Department from "./src/pages/Department";
import Home from "./src/pages/Home";
import Phonebook from "./src/pages/Phonebook";
import Position from "./src/pages/Position";
import Registration from "./src/pages/Registration";
import Login from "./src/pages/Login";
import { DEPARTMENT_ROUTE, HOME_ROUTE, PHONEBOOK_ROUTE, POSITION_ROUTE, REGISTRATION_ROUTE, LOGIN_ROUTE, PHONES_ROUTE } from "./src/utils/consts";
import Phones from "./src/pages/Phones";

export const authRoutes = [
  {
    path: HOME_ROUTE,
    Component: Home
  },
  {
    path: PHONEBOOK_ROUTE,
    Component: Phonebook
  },
  {
    path: DEPARTMENT_ROUTE,
    Component: Department
  },
  {
    path: POSITION_ROUTE,
    Component: Position
  },
  {
    path: PHONES_ROUTE,
    Component: Phones
  },
]

export const publicRoutes = [
  {
    path: LOGIN_ROUTE,
    Component: Login
  },
  {
    path: REGISTRATION_ROUTE,
    Component: Registration
  },
]
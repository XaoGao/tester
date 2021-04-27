import Department from "./src/pages/Department";
import Home from "./src/pages/Home";
import Phonebook from "./src/pages/Phonebook";
import Position from "./src/pages/Position";
import Registration from "./src/pages/Registration";
import Session from "./src/pages/Session";
import { DEPARTMENT_ROUTE, HOME_ROUTE, PHONEBOOK_ROUTE, POSITION_ROUTE, REGISTRATION_ROUTE, SESSION_ROUTE } from "./src/utils/consts";

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
]

export const publicRoutes = [
  {
    path: SESSION_ROUTE,
    Component: Session
  },
  {
    path: REGISTRATION_ROUTE,
    Component: Registration
  },
]
import { getAllDepartments } from "../http/departmentApi";

const SET_DEPATMENTS = "department/SET_DEPARTMENTS";
const SET_LOADING = "department/SET_LOADING";

const initialState = {
  loading: false,
  departments: [],
};

const departmentReducer = (state = initialState, action) => {
  switch (action.type) {
    case SET_DEPATMENTS:
      return {
        ...state,
        ...action.payload,
      };
    case SET_LOADING:
      return {
        ...state,
        ...action.payload,
      };
    default:
      return state;
  }
};
export default departmentReducer;

const setDepartment = (departments) => ({
  type: SET_DEPATMENTS,
  payload: { departments: departments },
});

const setLoading = (flag) => ({
  type: SET_LOADING,
  payload: { loading: flag },
});

export const getDepartments = () => async (dispatch) => {
  dispatch(setLoading(true));
  await getAllDepartments()
    .then((response) => {
      if (response.status === 200) {
        dispatch(setDepartment(response.data.departments.data));
      }
    })
    .finally(() => dispatch(setLoading(false)));
};

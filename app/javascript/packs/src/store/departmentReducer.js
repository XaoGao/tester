import {
  createDepartmentApi,
  getAllDepartmentsApi,
  updateDepartmentApi,
} from "../http/departmentApi";

const SET_DEPATMENTS = "department/SET_DEPARTMENTS";
const SET_DEPATMENT = "department/SET_DEPARTMENT";
const ADD_DEPATMENT = "department/ADD_DEPATMENT";
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
    case SET_DEPATMENT:
      return {
        ...state,
        departments: state.departments
          .map((item) => {
            if (item.id === action.payload.department.id) {
              return { ...item, ...action.payload.department };
            }
            return item;
          })
          .sort(function (a, b) {
            if (a.id < b.id) return -1;
            if (a.id > b.id) return 1;
            return 0;
          }),
      };
    case ADD_DEPATMENT:
      return {
        ...state,
        departments: state.departments
          .concat(action.payload.department)
          .sort(function (a, b) {
            if (a.id < b.id) return -1;
            if (a.id > b.id) return 1;
            return 0;
          }),
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

const setDepartments = (departments) => ({
  type: SET_DEPATMENTS,
  payload: { departments: departments },
});

const setDepartment = (department) => ({
  type: SET_DEPATMENT,
  payload: { department: department },
});

const addDepartment = (department) => ({
  type: ADD_DEPATMENT,
  payload: { department: department },
});

const setLoading = (flag) => ({
  type: SET_LOADING,
  payload: { loading: flag },
});

export const getDepartments = () => async (dispatch) => {
  dispatch(setLoading(true));
  return await getAllDepartmentsApi()
    .then((response) => {
      if (response.status === 200) {
        dispatch(setDepartments(response.data.departments.data));
      }
    })
    .finally(() => dispatch(setLoading(false)));
};

export const updateDepartment = (id, name, sortLevel, lock) => async (
  dispatch
) => {
  return await updateDepartmentApi(id, name, sortLevel, lock).then(
    (response) => {
      if (response.status === 200) {
        dispatch(setDepartment(response.data.department.data));
      }
    }
  );
};

export const createDepartment = (name, sortLevel, lock) => async (dispatch) => {
  return await createDepartmentApi(name, sortLevel, lock).then((response) => {
    if (response.status === 200) {
      dispatch(addDepartment(response.data.department.data));
    }
  });
};

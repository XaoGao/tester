import {
  getAllPhonesApi,
  updatePhoneApi,
  createPhoneApi,
} from "../http/phoneApi";

const SET_PHONES = "phones/SET_PHONES";
const SET_PHONE = "phones/SET_PHONE";
const ADD_PHONE = "phones/ADD_PHONE";
const SET_LOADING = "phones/SET_LOADING";

const initialState = {
  loading: false,
  phones: [],
};

const phoneReducer = (state = initialState, action) => {
  switch (action.type) {
    case SET_PHONES:
      return {
        ...state,
        ...action.payload,
      };
    case SET_LOADING:
      return {
        ...state,
        ...action.payload,
      };
    case ADD_PHONE:
      return {
        ...state,
        phones: state.phone.concat(action.payload.phone),
      };
    default:
      return state;
  }
};

export default phoneReducer;

const setPhones = (phones) => ({
  type: SET_PHONES,
  payload: { phones: phones },
});

const setPhone = (phone) => ({
  type: SET_PHONE,
  payload: { phone: phone },
});

const addPhone = (phone) => ({
  type: ADD_PHONE,
  payload: { phone: phone },
});

const setLoading = (flag) => ({
  type: SET_LOADING,
  payload: { loading: flag },
});

export const getPhones = () => async (dispatch) => {
  dispatch(setLoading(true));
  return await getAllPhonesApi()
    .then((response) => {
      if (response.status === 200) {
        dispatch(setPhones(response.data.phones.data));
      }
    })
    .finally(() => dispatch(setLoading(false)));
};
export const updatePhone = (id, number) => async (dispatch) => {
  return await updatePhoneApi(id, number).then((response) => {
    if (response.status === 200) {
      dispatch(setPhone(response.data.phone.data));
    }
  });
};

export const createPhone = (number) => async (dispatch) => {
  return await createPhoneApi(number).then((response) => {
    if (response.status === 200) {
      dispatch(addPhone(response.data.phone.data));
    }
  });
};

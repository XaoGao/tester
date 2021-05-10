import { getPhonebookApi } from "../http/phonebookApi";

const SET_PHONEBOOK = "phonebook/SET_PHONEBOOK";
const SET_LOADING = "phonebook/SET_LOADING";

const initialState = {
  loading: false,
  phonebook: [],
};

const phonebookReducer = (state = initialState, action) => {
  switch (action.type) {
    case SET_PHONEBOOK:
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

export default phonebookReducer;

const setPhonebook = (phonebook) => ({
  type: SET_PHONEBOOK,
  payload: { phonebook: phonebook },
});

const setLoading = (flag) => ({
  type: SET_LOADING,
  payload: { loading: flag },
});

export const getPhonebook = () => async (dispatch) => {
  dispatch(setLoading(true));
  return await getPhonebookApi()
    .then((response) => {
      if (response.status === 200) {
        dispatch(setPhonebook(response.data.phonebook.data));
      }
    })
    .finally(() => {
      dispatch(setLoading(false));
    });
};

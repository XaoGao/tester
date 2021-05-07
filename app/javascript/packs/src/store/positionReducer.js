import { getAllPositions } from "../http/positionApi";

const SET_POSITIONS = "position/SET_POSITIONS";
const SET_LOADING = "department/SET_LOADING";

const initialState = {
  loading: false,
  positions: [],
  position: null,
};

const positionReducer = (state = initialState, action) => {
  switch (action.type) {
    case SET_POSITIONS:
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

const setPositions = (positions) => ({
  type: SET_POSITIONS,
  payload: { positions: positions },
});

const setLoading = (flag) => ({
  type: SET_LOADING,
  payload: { loading: flag },
});

export const getPositions = () => async (dispatch) => {
  dispatch(setLoading(true));
  return await getAllPositions()
    .then((response) => {
      if (response.status === 200) {
        dispatch(setPositions(response.data.positions.data));
      }
    })
    .finally(() => dispatch(setLoading(false)));
};

export default positionReducer;

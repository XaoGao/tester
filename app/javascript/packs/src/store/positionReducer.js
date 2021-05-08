import { getAllPositionsApi, updatePositionApi } from "../http/positionApi";

const SET_POSITIONS = "position/SET_POSITIONS";
const SET_POSITION = "position/SET_POSITION";
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
    case SET_POSITION:
      return {
        ...state,
        positions: state.positions.map((item) => { 
          if(item.id === action.payload.position.id) {
            return { ...item, ...action.payload.position }
          }
          return item;
         })
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

const setPosition = (position) => ({
  type: SET_POSITION,
  payload: { position: position },
});

const setLoading = (flag) => ({
  type: SET_LOADING,
  payload: { loading: flag },
});

export const getPositions = () => async (dispatch) => {
  dispatch(setLoading(true));
  return await getAllPositionsApi()
    .then((response) => {
      if (response.status === 200) {
        dispatch(setPositions(response.data.positions.data));
      }
    })
    .finally(() => dispatch(setLoading(false)));
};

export const updatePosition = (id, name, sortLevel, lock) => async (
  dispatch
) => {
  return await updatePositionApi(id, name, sortLevel, lock).then((response) => {
    if (response.status === 200) {
      dispatch(setPosition(response.data.position.data));
    }
  });
};

export default positionReducer;

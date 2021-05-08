import {
  createPositionApi,
  getAllPositionsApi,
  updatePositionApi,
} from "../http/positionApi";

const SET_POSITIONS = "position/SET_POSITIONS";
const SET_POSITION = "position/SET_POSITION";
const ADD_POSITION = "position/ADD_POSITION";
const SET_LOADING = "position/SET_LOADING";

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
        positions: state.positions
          .map((item) => {
            if (item.id === action.payload.position.id) {
              return { ...item, ...action.payload.position };
            }
            return item;
          })
          .sort(function (a, b) {
            if (a.id < b.id) return -1;
            if (a.id > b.id) return 1;
            return 0;
          }),
      };
    case ADD_POSITION:
      return {
        ...state,
        positions: state.positions
          .concat(action.payload.position)
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

export default positionReducer;

const setPositions = (positions) => ({
  type: SET_POSITIONS,
  payload: { positions: positions },
});

const setPosition = (position) => ({
  type: SET_POSITION,
  payload: { position: position },
});

const addPosition = (position) => ({
  type: ADD_POSITION,
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

export const createPosition = (name, sortLevel, lock) => async (dispatch) => {
  return await createPositionApi(name, sortLevel, lock).then((response) => {
    if (response.status === 200) {
      dispatch(addPosition(response.data.position.data));
    }
  });
};

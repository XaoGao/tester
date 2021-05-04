import { getAllPositions } from '../http/positionApi'
const SET_POSITIONS = 'position/SET_POSITIONS'

const defaultState = {
  positions: [],
  position: null
}

const positionReducer = (state = defaultState, action) => {
  switch (action.type) {
    case SET_POSITIONS:
      return {
        ...state,
        ...action.payload
      }
  
    default:
      return state;        
  }
}

const setPositions = (positions) => ({
  type: SET_POSITIONS,
  payload: { positions: positions }
})

export const getPositions = () => async (dispatch) => {
  return await getAllPositions()
    .then((response) => {
      if (response.status === 200) {
        dispatch(setPositions(response.data.positions.data));
      }
  })
}

export default positionReducer;

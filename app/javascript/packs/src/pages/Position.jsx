import React, { useState, useEffect } from 'react'
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import { connect } from 'react-redux'
import { getPositions } from '../store/positionReducer'
import CardEl from '../components/CardEl';

const useStyles = makeStyles({
  root: {
    marginTop: 50
  },
  el: {
    marginTop: 25
  }
}); 


const Position = (props) => {
  const classes = useStyles();
  const [currentPosition, setCurrentPosition] = useState(null);
  useEffect(() => {
    props.getPositions();
  },[]);

  const positionsCard = props.positions.map(p => <CardEl key={p.id} header={p.attributes.name} buttonName="Редактировать"/>)
  
  return (
    <Box margin="auto" width={500} textAlign="center" className={classes.root}>
      <Typography variant="h3" component="h2">
        Отделы
      </Typography>
      {positionsCard}
    </Box>
  )
}

let mapStateToProps = (state) => {
  return {
    positions: state.position.positions,
    position: state.position.position
  }
}

export default connect(mapStateToProps, { getPositions })(Position);
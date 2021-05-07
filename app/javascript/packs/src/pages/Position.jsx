import React, { useState, useEffect } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import Box from "@material-ui/core/Box";
import { connect } from "react-redux";
import { getPositions } from "../store/positionReducer";
import CardEl from "../components/phonebook/CardEl";

const useStyles = makeStyles({
  root: {
    marginTop: 50,
  },
  el: {
    marginTop: 25,
  },
});

const Position = (props) => {
  const classes = useStyles();
  useEffect(() => {
    props.getPositions();
  }, []);

  const positionsCard = props.positions.map((p) => (
    <CardEl key={p.id} attributes={p.attributes} buttonName="Редактировать" />
  ));

  return (
    <>
      {props.loading ? (
        <div>Отделы</div>
      ) : (
        <Box
          className={classes.root}
        >
          <Typography variant="h3" component="h2">
            Должности
          </Typography>
          {positionsCard}
        </Box>
      )}
    </>
  );
};

let mapStateToProps = (state) => {
  return {
    loading: state.position.loading,
    positions: state.position.positions,
    position: state.position.position,
  };
};

export default connect(mapStateToProps, { getPositions })(Position);

import React, { useEffect } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import Box from "@material-ui/core/Box";
import { connect } from "react-redux";
import {
  getPositions,
  updatePosition,
  createPosition,
} from "../store/positionReducer";
import CardEl from "../components/phonebook/CardEl";
import CreateButton from "../components/phonebook/CreateButton";

const useStyles = makeStyles({
  root: {
    marginTop: 50,
  },
  el: {
    marginTop: 25,
  },
  createButton: {
    margin: "auto",
  },
});

const Position = (props) => {
  const classes = useStyles();

  useEffect(() => {
    props.getPositions();
  }, []);

  const positionsCard = props.positions.map((p) => (
    <CardEl
      key={p.id}
      id={p.id}
      name={p.attributes.name}
      attributes={p.attributes}
      buttonName="Редактировать"
      update={props.updatePosition}
    />
  ));

  return (
    <>
      {props.loading ? (
        <div>Ожидайте</div>
      ) : (
        <>
          <Box className={classes.root}>
            <Box display="flex" className={classes.createButton}>
              <Typography variant="h3" component="h2">
                Должности
              </Typography>
              <CreateButton create={props.createPosition} />
            </Box>
            {positionsCard}
          </Box>
        </>
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

export default connect(mapStateToProps, {
  getPositions,
  updatePosition,
  createPosition,
})(Position);

import React from "react";
import EditIcon from "@material-ui/icons/Edit";
import DeleteIcon from "@material-ui/icons/Delete";
import { Button } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles({
  icon: {
    marginLeft: 10,
  },
  lock: {
    backgroundColor: "grey",
  },
});

const Icons = () => {
  const classes = useStyles();
  return (
    <>
      <Button title="Редактировать">
        <EditIcon color="primary" className={classes.icon} fontSize="large" />
      </Button>
      <Button title="Заблокировать">
        <DeleteIcon
          color="secondary"
          className={classes.icon}
          fontSize="large"
        />
      </Button>
    </>
  );
};
export default Icons;

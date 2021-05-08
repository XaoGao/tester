import React, { useEffect } from "react";
import { connect } from "react-redux";
import CardEl from "../components/phonebook/CardEl";
import {
  getDepartments,
  updateDepartment,
  createDepartment,
} from "../store/departmentReducer";
import { makeStyles } from "@material-ui/core/styles";
import Box from "@material-ui/core/Box";
import Typography from "@material-ui/core/Typography";
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

const Department = (props) => {
  const classes = useStyles();
  useEffect(() => {
    props.getDepartments();
  }, []);

  const departmentsCard = props.departments.map((d) => (
    <CardEl
      key={d.id}
      id={d.id}
      attributes={d.attributes}
      buttonName="Редактировать"
      update={props.updateDepartment}
    />
  ));

  return (
    <>
      {props.loading ? (
        <div>Ожидайте</div>
      ) : (
        <Box className={classes.root}>
          <Box display="flex" className={classes.createButton}>
            <Typography variant="h3" component="h2">
              Отделы
            </Typography>
            <CreateButton create={props.createDepartment} />
          </Box>
          {departmentsCard}
        </Box>
      )}
    </>
  );
};

let mapStateToProps = (state) => {
  return {
    loading: state.department.loading,
    departments: state.department.departments,
  };
};

export default connect(mapStateToProps, {
  getDepartments,
  updateDepartment,
  createDepartment,
})(Department);

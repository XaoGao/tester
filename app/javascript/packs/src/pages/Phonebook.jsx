import React, { useEffect } from "react";
import { connect } from "react-redux";
import { getPhonebook } from "../store/phonebookReducer";
import TableDepartment from "../components/phonebook/TableDepartment";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import Box from '@material-ui/core/Box';

const useStyles = makeStyles({
  root: {
    marginTop: 30,
  },
});
const Phonebook = (props) => {
  const classes = useStyles();
  useEffect(() => {
    props.getPhonebook();
  }, []);

  const tableEl = props.phonebook.map((t) => (
    <TableDepartment key={t.id} attributes={t.attributes} />
  ));
  return (
    <>
      {props.loading ? (
        <div>Ожидайте</div>
      ) : (
        <>
          <Typography variant="h4" gutterBottom>
            <Box textAlign="center" m={1}>
            Телефонный справочник
            </Box>
          </Typography>
          <div className={classes.root}>{tableEl}</div>
        </>
      )}
    </>
  );
};

const mapStateToProps = (state) => {
  return {
    loading: state.phonebook.loading,
    phonebook: state.phonebook.phonebook,
  };
};
export default connect(mapStateToProps, { getPhonebook })(Phonebook);

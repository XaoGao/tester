import React from "react";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";
import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles({
  table: {
    minWidth: 650,
  },
});

const TableDepartment = (props) => {
  const classes = useStyles();

  const rows = props.attributes.users.map((u) => (
    <TableRow key={u.fullName}>
      <TableCell align="left">
        {u.fullName}
      </TableCell>
      <TableCell align="left">
        {u.position}
      </TableCell>
      <TableCell align="left">
        {u.phone}
      </TableCell>
    </TableRow>
  ));

  return (
    <TableContainer component={Paper}>
      <Table className={classes.table} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>{props.attributes.name}</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows}
        </TableBody>
      </Table>
    </TableContainer>
  );
};
export default TableDepartment;

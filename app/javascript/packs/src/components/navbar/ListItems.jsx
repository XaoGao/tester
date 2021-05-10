import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import { List, ListItem, ListItemText } from "@material-ui/core";
import { Link } from "react-router-dom";
import { HOME_ROUTE } from "../../utils/consts";
import PhonebookDropdown from "./PhonebookDropdown";

const useStyles = makeStyles((theme) => ({
  navDisplayFlex: {
    display: `flex`,
  },
  linkText: {
    textDecoration: `none`,
    textTransform: `uppercase`,
    color: `white`,
  },
}));

const ListItems = () => {
  const classes = useStyles();
  return (
    <List
      component="nav"
      aria-labelledby="main navigation"
      className={classes.navDisplayFlex}
    >
      <Link to={HOME_ROUTE} className={classes.linkText}>
        <ListItem button>
          <ListItemText primary="Tester" />
        </ListItem>
      </Link>
      <PhonebookDropdown/>
    </List>
  );
};
export default ListItems;

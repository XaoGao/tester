import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import { List, ListItem, ListItemText } from "@material-ui/core";
import { Link } from "react-router-dom";
import { DEPARTMENT_ROUTE, HOME_ROUTE, PHONES_ROUTE, POSITION_ROUTE } from "../../utils/consts";

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
      className={classes.navDisplayFlex} // this
    >
      <Link to={HOME_ROUTE} className={classes.linkText}>
        <ListItem button>
          <ListItemText primary="Tester" />
        </ListItem>
      </Link>
      <Link to={POSITION_ROUTE} className={classes.linkText}>
        <ListItem button>
          <ListItemText primary="Должность" />
        </ListItem>
      </Link>
      <Link to={DEPARTMENT_ROUTE} className={classes.linkText}>
        <ListItem button>
          <ListItemText primary="Отделы" />
        </ListItem>
      </Link>
      <Link to={PHONES_ROUTE} className={classes.linkText}>
        <ListItem button>
          <ListItemText primary="Телефоны" />
        </ListItem>
      </Link>
    </List>
  );
};
export default ListItems;

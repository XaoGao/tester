import React from "react";
import Menu from "@material-ui/core/Menu";
import MenuItem from "@material-ui/core/MenuItem";
import Button from "@material-ui/core/Button";
import { DEPARTMENT_ROUTE, PHONEBOOK_ROUTE, PHONES_ROUTE, POSITION_ROUTE } from "../../utils/consts";
import { Link } from "react-router-dom";
import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
  },
  homeLink: {
    color: "white",
    textDecoration: "none",
  },
}));

const PhonebookDropdown = () => {
  const classes = useStyles();
  const [anchorEl, setAnchorEl] = React.useState(null);

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const logout = () => {
    setAnchorEl(null);
    props.logout();
  };
  return (
    <>
      <Button
        aria-controls="simple-menu"
        aria-haspopup="true"
        onClick={handleClick}
        className={classes.homeLink}
      >
        Телефонный справочник
      </Button>
      <Menu
        id="simple-menu"
        anchorEl={anchorEl}
        keepMounted
        open={Boolean(anchorEl)}  
        onClose={handleClose}
      >
        <Link to={POSITION_ROUTE}>
          <MenuItem onClick={handleClose}>Должность</MenuItem>
        </Link>
        <Link to={DEPARTMENT_ROUTE}>
          <MenuItem onClick={handleClose}>Отделы</MenuItem>
        </Link>
        <Link to={PHONES_ROUTE}>
          <MenuItem onClick={handleClose}>Телефоны</MenuItem>
        </Link>
        <Link to={PHONEBOOK_ROUTE}>
          <MenuItem onClick={handleClose}>Телефонный справочник</MenuItem>
        </Link>
      </Menu>
    </>
  );
};
export default PhonebookDropdown;

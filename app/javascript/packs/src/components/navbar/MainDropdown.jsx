import React from "react";
import Menu from "@material-ui/core/Menu";
import MenuItem from "@material-ui/core/MenuItem";
import Button from "@material-ui/core/Button";
import { LOGIN_ROUTE } from "../../utils/consts";
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

const MainDropdown = (props) => {
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
  }

  return (
    <>
      {props.isAuth ? (
        <>
          <Button
            aria-controls="simple-menu"
            aria-haspopup="true"
            onClick={handleClick}
            className={classes.homeLink}
          >
            {props.fullName}
          </Button>
          <Menu
            id="simple-menu"
            anchorEl={anchorEl}
            keepMounted
            open={Boolean(anchorEl)}
            onClose={handleClose}
          >
            <MenuItem onClick={handleClose}>Profile</MenuItem>
            <MenuItem onClick={() => logout()}>Выйти</MenuItem>
          </Menu>
        </>
      ) : (
        <>
          <Link to={LOGIN_ROUTE}>
            <Button variant="contained" className={classes.button}>
              Войти
            </Button>
          </Link>
        </>
      )}
    </>
  );
};
export default MainDropdown;

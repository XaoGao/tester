import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import { connect } from "react-redux";
import { logout } from "../store/authReducer";
import MainDropdown from "./navbar/MainDropdown";
import ListItems from "./navbar/ListItems";


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
}));

const Navbar = (props) => {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <AppBar position="static">
        <Toolbar>
          <Typography variant="h6" className={classes.title}>
            <ListItems/>
          </Typography>
          <MainDropdown
            isAuth={props.isAuth}
            fullName={props.fullName}
            logout={props.logout}
          />
        </Toolbar>
      </AppBar>
    </div>
  );
};

const mapStateToProps = (state) => ({
  isAuth: state.auth.isAuth,
  fullName: state.auth.fullName,
});

export default connect(mapStateToProps, { logout })(Navbar);

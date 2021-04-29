import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom'

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
  }
}));

const Navbar = ({isAuth, fullName}) => {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <AppBar position="static">
        <Toolbar>
          <Typography variant="h6" className={classes.title}>
            Tester
          </Typography>
          {
            isAuth ? 
            <Button variant="contained" className={classes.button}>{fullName}</Button>
            :
            <Link to="/login">
              <Button variant="contained" className={classes.button}>Войти</Button>
            </Link>
          }
        </Toolbar>
      </AppBar>
    </div>
  );
}

const mapStateToProps = state => ({
  isAuth: state.auth.isAuth,
  fullName: state.auth.fullName
});

export default connect(mapStateToProps, {})(Navbar);
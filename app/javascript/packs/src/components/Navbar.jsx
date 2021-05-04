import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom'
import { logout } from '../store/authReducer'
import { HOME_ROUTE, LOGIN_ROUTE, POSITION_ROUTE } from '../utils/consts';

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
    color: 'white',
    textDecoration: 'none'
  }
}));

const Navbar = (props) => {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <AppBar position="static">
        <Toolbar>
            <Typography variant="h6" className={classes.title}>
              <Link to={HOME_ROUTE} className={classes.homeLink}>
                Tester
              </Link>
              <Link to={POSITION_ROUTE} className={classes.homeLink}>
                Отделы
              </Link>
            </Typography>
          {
            props.isAuth ? 
            <>
              <Button variant="contained" className={classes.button}>{props.fullName}</Button>
              <Button variant="contained" className={classes.button} onClick={() => props.logout()}>Выйти</Button>
            </>
            :
            <Link to={LOGIN_ROUTE}>
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

export default connect(mapStateToProps, { logout })(Navbar);
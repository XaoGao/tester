import React, { useState } from 'react'
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import TextField from '@material-ui/core/TextField';
import { signin } from '../store/authReducer'
import { connect } from 'react-redux';
import { Redirect } from 'react-router';
import { alert } from '../utils/toast';
import { Link } from 'react-router-dom'
import { REGISTRATION_ROUTE } from '../utils/consts';

const useStyles = makeStyles({
  root: {
    minWidth: 275,
    marginTop: 100
  },
  login: {
    marginTop: 25,
    minWidth: 275,
  },
  password: {
    marginTop: 15,
    marginBottom: 10,
    minWidth: 275,
    maxWidth: 400
  },
}); 

const Login = (props) => {
  const classes = useStyles();
  const [login, setLogin] = useState("doctor");
  const [password, setPassword] = useState("password");

  if(props.isAuth) {
    return <Redirect to="/" />
  }

  const signinHandler = (login, password) => {
    props.signin(login, password)
    .then((_) => {
      alert.success("Добро пожаловать!")
    })
    .catch((error) => {
      alert.error(error.message);
    })
  }

  return (
    <Box margin="auto" width={500}  textAlign="center">
      <Card className={classes.root}>
        <CardContent>
          <Typography variant="h5" component="h2">
            Войти
          </Typography>
          <hr/>
          <TextField label="Логин" className={classes.login} defaultValue={login} onChange={(e) => {setLogin(e.target.value)}}/>
          <br/>
          <TextField label="Пароль" className={classes.password} defaultValue={password} onChange={(e) => {setPassword(e.target.value)}}/>
          <hr/>
        </CardContent>
        <CardActions>
          <Button color="primary" variant="contained" onClick={() => signinHandler(login, password)}>Войти</Button>
          <Link to={REGISTRATION_ROUTE}>
            <Button color="secondary" variant="contained">Зарегистрироваться</Button>
          </Link>
        </CardActions>
      </Card>
      </Box>
  )
}
let mapStateToProps = (state) => {
  return {
    isAuth: state.auth.isAuth,
  };
};
export default connect(mapStateToProps, { signin })(Login)

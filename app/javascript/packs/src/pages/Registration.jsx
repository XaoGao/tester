import React, { useState } from 'react'
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import TextField from '@material-ui/core/TextField';
import { signup } from '../store/authReducer'
import { connect } from 'react-redux';
import { Redirect } from 'react-router';
import { Link } from 'react-router-dom'
import { LOGIN_ROUTE } from '../utils/consts';
import { alert } from '../utils/toast';


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

const Registration = (props) => {
  const classes = useStyles();
  const [firstName, setFirstName] = useState("jon");
  const [lastName, setLastName] = useState("josh");
  const [middleName, setMiddleName] = useState("jordan");
  const [login, setLogin] = useState("login");
  const [password, setPassword] = useState("password");

  if(props.isAuth) {
    return <Redirect to="/" />
  }

  const signupHandler = (firstName, lastNam, middleName, login, password) => {
    props.signup(firstName, lastNam, middleName, login, password)
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
            Зарегистрироваться
          </Typography>
          <hr/>
          <TextField label="Логин" className={classes.login} defaultValue={login} onChange={(e) => {setLogin(e.target.value)}}/>
          <br/>
          <TextField label="Пароль" className={classes.password} defaultValue={password} onChange={(e) => {setPassword(e.target.value)}}/>
          <br/>
          <TextField label="Фамили" className={classes.password} defaultValue={lastName} onChange={(e) => {setLastName(e.target.value)}}/>
          <br/>
          <TextField label="Имя" className={classes.password} defaultValue={firstName} onChange={(e) => {setFirstName(e.target.value)}}/>
          <br/>
          <TextField label="Отчество" className={classes.password} defaultValue={middleName} onChange={(e) => {setMiddleName(e.target.value)}}/>
          <hr/>
        </CardContent>
        <CardActions>
          <Button color="primary" variant="contained" onClick={() => signupHandler(firstName, lastName, middleName, login, password)}>Зарегистрироваться</Button>
          <Link to={LOGIN_ROUTE}>
            <Button color="secondary" variant="contained">Войти</Button>
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
export default connect(mapStateToProps, { signup })(Registration)

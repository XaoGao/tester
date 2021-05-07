import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import Grid from '@material-ui/core/Grid';
import Icons from './Icons'

const useStyles = makeStyles({
  root: {
    minWidth: 400,
    marginTop: 25
  },
  title: {
    marginTop: 10
  },
  lock: {
    backgroundColor: "grey"
  }
});

const CardEl = (props) => {
  const classes = useStyles();
  return (
    <Box boxShadow={3} >
      <Card className={classes.root}>
        <CardContent className={props.attributes.lock ? classes.lock : ''} title={props.attributes.lock ? 'Заблокировано' : ''}>
          <Grid container spacing={3}>
            <Grid item xs={10}>
              <Typography variant="h5" component="h2" className={classes.title}>
                {props.attributes.sortLevel}) {props.attributes.name}
              </Typography>
            </Grid>
            <Grid item xs={2}>
              <Icons />
            </Grid>
          </Grid>
        </CardContent>
      </Card>
    </Box>
  )
}

export default CardEl;
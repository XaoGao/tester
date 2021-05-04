import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { shadows } from '@material-ui/system';
import Box from '@material-ui/core/Box';

const useStyles = makeStyles({
  root: {
    minWidth: 275,
    marginTop: 25
  },
});

const CardEl = (props) => {
  const classes = useStyles();
  return (
    <Box margin="auto" textAlign="center" boxShadow={3}>
      <Card className={classes.root}>
        <CardContent>
          <Typography variant="h5" component="h2">
            {props.header}
          </Typography>
        </CardContent>
        <CardActions>
        <Button variant="contained" color="primary">
          {props.buttonName}
        </Button>
        </CardActions>
      </Card>
    </Box>
  )
}

export default CardEl;
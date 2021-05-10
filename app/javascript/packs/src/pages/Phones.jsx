import React, { useEffect } from "react";
import { connect } from "react-redux";
import CardEl from "../components/phonebook/CardEl";
import { getPhones, createPhone, updatePhone } from "../store/phoneReducer";
import Box from "@material-ui/core/Box";
import CreateButton from "../components/phonebook/CreateButton";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";

const useStyles = makeStyles({
  root: {
    marginTop: 50,
  },
  el: {
    marginTop: 25,
  },
  createButton: {
    margin: "auto",
  },
});


const Phones = (props) => {
  const classes = useStyles();
  useEffect(() => {
    props.getPhones();
  }, []);

  const phonesCard = props.phones.map((p) => (
    <CardEl
      key={p.id}
      id={p.id}
      name={p.attributes.number}
      attributes={p.attributes}
      buttonName="Редактировать"
      update={props.updatePosition}
    />
  ));

  return (
    <>
      {props.loading ? (
        <div>Ожидайте</div>
      ) : (
        <>
          <Box className={classes.root}>
            <Box display="flex" className={classes.createButton}>
              <Typography variant="h3" component="h2">
                Телефоны
              </Typography>
              <CreateButton create={props.createButton} />
            </Box>
            {phonesCard}
          </Box>
        </>
      )}
    </>
  );
};

const mapStateToProps = (state) => {
  return {
    loading: state.phone.loading,
    phones: state.phone.phones,
  };
};

export default connect(mapStateToProps, {
  getPhones,
  createPhone,
  updatePhone,
})(Phones);

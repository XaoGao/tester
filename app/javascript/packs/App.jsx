import React, { useEffect } from "react";
import AppRouter from "./src/components/AppRouter";
import Navbar from "./src/components/Navbar";
import Container from "@material-ui/core/Container";
import { connect } from "react-redux";
import { initialApp } from './src/store/appReducer'

const App = (props) => {
  useEffect(() => {
    props.initialApp();
  }, [])
  return (
    <>
      <Navbar />
      <Container>
        <AppRouter />
      </Container>
    </>
  );
};

const mapStateToProps = (state) => ({
  iappInit: state.app.init,
});

export default connect(mapStateToProps, { initialApp })(App);

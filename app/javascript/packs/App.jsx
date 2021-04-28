import React from 'react'
import { BrowserRouter } from 'react-router-dom';
import AppRouter from './src/components/AppRouter';
import Navbar from './src/components/Navbar';
import Container from '@material-ui/core/Container';
import { Provider } from 'react-redux'
import store from './src/store/store'

const App = () => {
  return (
    <BrowserRouter>
      <Provider store={store}>
        <Navbar />
        <Container>
          <AppRouter/>
        </Container>
      </Provider>
    </BrowserRouter>
  )
}
export default App;
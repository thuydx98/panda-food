import React from 'react';
import 'react-native-gesture-handler';
import { Provider } from 'react-redux';
import { PersistGate } from 'redux-persist/integration/react';

import Menu from './navigation/Menu';
import persist from './configs/store';
import axios from 'axios';

axios.interceptors.request.use(request => {
  return request;
}, error => {
  console.log(request, error);
  return Promise.reject(error);
});

axios.interceptors.response.use(response => {
  return response;
}, error => {
  console.log(response, error);
  return Promise.reject(error);
});

const persistStore = persist();

export default function App() {
  return (
    <Provider store={persistStore.store}>
      <PersistGate loading={null} persistor={persistStore.persistor}>
          <Menu />
      </PersistGate>
    </Provider>
  );
}

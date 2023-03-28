import { Route, Routes } from 'react-router-dom';
import './App.css';
import Login from './pages/Login';
import Register from './pages/Register';
import Tasks from './pages/Tasks';
import ProtectedRoutes from './utils/ProtectedRoutes';

function App() {
  return (
    <Routes>
      <Route path='/login' element={<Login />} />
      <Route path='/register' element={<Register />} />
      <Route path="/" element={
        <ProtectedRoutes>
          <Tasks />
        </ProtectedRoutes>
      } />
    </Routes>
  );
}

export default App;

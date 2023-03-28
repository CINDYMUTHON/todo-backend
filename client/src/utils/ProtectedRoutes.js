import React from "react"
import { Navigate, useLocation } from "react-router-dom";

const ProtectedRoutes = ({ children }) => {
  const user = JSON.parse(localStorage.getItem("user"))
  const token = localStorage.getItem('token')
  let isLoggedIn = false
  if (user && token) {
    isLoggedIn = true
  }
  const location = useLocation()

  if (!isLoggedIn) {
    return <Navigate to="/login" state={{ from : location }} replace />;
  }

  return children
}

export default ProtectedRoutes
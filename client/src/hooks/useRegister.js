import React, { useState } from "react";
import { register } from "../services/webApis";
import { useNavigate } from "react-router-dom";

export const useRegister = () => {
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [gender, setGender] = useState("");

  const navigate = useNavigate();
  const handleRegister = async (e) => {
    e.preventDefault();

    const registerPayload = {
      username,
      password,
      email,
      gender,
    };

    try {
      // hit the register service
      // use a promise to handle the response
      const response = await register(registerPayload);

      //   get the data object

      const { data } = response;

      if (data) {
        //   redirect the user to login screen
        navigate("/login");
        //   reset the registration fields
        setUsername("");
        setEmail("");
        setPassword("");
        setGender("");
      }
    } catch (error) {
      console.log(error);
    }
  };

  return {
    username,
    setUsername,
    email,
    setEmail,
    password,
    setPassword,
    gender,
    setGender,
    handleRegister,
  };
};

import React from "react";
// import the hook
import { useRegister } from "../hooks/useRegister";

const Register = () => {
  const {
    username,
    setUsername,
    email,
    setEmail,
    password,
    setPassword,
    gender,
    setGender,
    handleRegister
  } = useRegister();

  return (
    <div>
      <form onSubmit={handleRegister}>
        <div>
          <label>Username</label>
          <input type="text" value={username} onChange={(e) => setUsername(e.target.value)} placeholder="Enter username" />
        </div>
        <div>
          <label>Email</label>
          <input type="text" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Enter email" />
        </div>
        <div>
          <label>Password</label>
          <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} placeholder="Enter password" />
        </div>
        <div>
          <label>Gender</label>
          <input type="text" value={gender} onChange={(e) => setGender(e.target.value)} placeholder="Enter gender" />
        </div>

        <div>
            <button>Submit</button>
        </div>
      </form>
    </div>
  );
};

export default Register;

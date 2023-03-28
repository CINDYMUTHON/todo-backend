import React from "react";
// import the hooks
import { useLogin } from "../hooks/useLogin";

const Login = () => {
  const { email, setEmail, password, setPassword, handleLogin } = useLogin();

  return (
    <div>
      <form onSubmit={handleLogin}>
        <div>
          <label>Email</label>
          <input
            type="text"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder="Enter email"
          />
        </div>
        <div>
          <label>Password</label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            placeholder="Enter password"
          />
        </div>

        <div>
            <button>Submit</button>
        </div>
      </form>
    </div>
  );
};

export default Login;

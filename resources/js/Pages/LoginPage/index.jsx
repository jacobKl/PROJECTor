import "./styles.scss";
import React from "react";
import Layout from "../../app/components/Layout";
import LoginForm from "../../app/components/LoginForm";
import { router } from "@inertiajs/react";


const LoginPage = () => {
    const handleClick = () => {
        router.visit('/register');
    }

    return (
        <div className="row login-page-row">
            <div className="login-page-form-column">
                <h1>Welcome back!</h1>
                <h3>Sign in to streamline your team’s time and tasks.</h3>
                <LoginForm />
            </div>
            <div className="login-page-register-column">
                <p className="login-page-welcome h1">Welcome to Projector!</p>
                <p className="login-page-no-account h3">Don’t have an account yet?</p>
                <div>
                    <button onClick={handleClick} className="btn btn-white">Register</button>
                </div>
            </div>
        </div>
    );
};

LoginPage.layout = (page) => (
    <Layout
        children={page}
        title="ProjectOR | Welcome back!"
        showHeader={false}
        showFooter={false}
        mainClass={"login-page"}
    />
);

export default LoginPage;

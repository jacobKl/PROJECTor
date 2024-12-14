import "./styles.scss";
import React from "react";
import Layout from "../../app/components/Layout";
import LoginForm from "../../app/components/LoginForm";

const LoginPage = () => {
    return (
        <div className="row login-page-row">
            <div className="login-page-form-column">
                <h1>Welcome back!</h1>
                <h3>Sign in to streamline your team’s time and tasks.</h3>
                <LoginForm />
            </div>
            <div className="login-page-register-column">

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

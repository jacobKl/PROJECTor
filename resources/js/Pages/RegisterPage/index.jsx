import "./styles.scss";
import React from "react";
import Layout from "../../app/components/Layout";
import RegisterForm from "../../app/components/RegisterForm"

const RegisterPage = () => {
    return (
        <div className="register-form-wrapper">
            <RegisterForm />
        </div>
    );
};

RegisterPage.layout = (page) => (
    <Layout
        children={page}
        title="Projector | Register"
        showAside={false}
        mainClass={"register-page"}
    />
);

export default RegisterPage;

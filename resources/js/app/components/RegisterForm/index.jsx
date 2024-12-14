import "./styles.scss";
import React from "react";
import Input from "../Input";
import { useForm, router } from "@inertiajs/react";

const RegisterForm = () => {
    const { data, setData, post, processing, errors } = useForm({
        email: "",
        password: "",
        password_confirmation: "",
    });

    const submit = (e) => {
        e.preventDefault();

        post("/register", {
            onSuccess: () => router.visit("/login"),
        });
    };

    return (
        <form className="register-form" onSubmit={submit}>
            <h3>Create an account</h3>
            <Input
                name="email"
                label="E-mail"
                isRequired={true}
                value={data?.email}
                onInput={(e) => setData("email", e.target.value)}
                error={errors?.email}
            />
            <Input
                name="password"
                label="Password"
                isRequired={true}
                value={data?.password}
                onInput={(e) => setData("password", e.target.value)}
                error={errors?.password}
            />
            <Input
                name="password_confirmation"
                label="Confirm Password"
                isRequired={true}
                value={data?.password_confirmation}
                onInput={(e) =>
                    setData("password_confirmation", e.target.value)
                }
                error={errors?.password}
            />

            <input type="submit" className="btn btn-primary" value="Register" />
        </form>
    );
};

export default RegisterForm;

import "./styles.scss";
import React from "react";
import Input from "../../components/Input";
import { useForm, router } from "@inertiajs/react";

const LoginForm = () => {
    const { data, setData, post, processing, errors } = useForm({
        email: "",
        password: "",
    });

    const { email, password } = data;

    const submit = (e) => {
        e.preventDefault();

        post("/login");
    };

    return (
        <form className="login-form" onSubmit={submit}>
            <Input
                name="email"
                placeholder="Enter Your e-mail address"
                label="Email"
                isRequired={true}
                value={email}
                onInput={(e) => setData("email", e.target.value)}
                error={errors?.email}
            />
            <Input
                name="password"
                type="password"
                placeholder="Enter Your password"
                label="Password"
                isRequired={true}
                value={password}
                onInput={(e) => setData("password", e.target.value)}
                error={errors?.password}
            />
            <input className="btn btn-primary" type="submit" disabled={processing} value="Login" />
        </form>
    );
};

export default LoginForm;

import "./styles.scss";
import React from "react";
import { useForm, router } from "@inertiajs/react";
import Input from "../Input";

const CreateProjectForm = () => {
    const { data, setData, post, processing, errors } = useForm({
        name: "",
        description: "",
        deadline: "",
    });

    const submit = (e) => {
        e.preventDefault();

        post("/projects", {
            onSuccess: () => router.visit("/"),
        });
    };

    return (
        <div className="create-project card">
            <h3>Create project</h3>
            <form className="create-project-form" onSubmit={submit}>
                <Input
                    name="name"
                    label="Name"
                    isRequired={true}
                    error={errors?.name}
                    value={data?.name}
                    onInput={(e) => setData("name", e.target.value)}
                />
                <Input
                    name="description"
                    label="Description"
                    isRequired={true}
                    error={errors?.description}
                    value={data?.description}
                    onInput={(e) => setData("description", e.target.value)}
                    type="textarea"
                />
                <Input
                    name="deadline"
                    label="Deadline"
                    isRequired={true}
                    error={errors?.deadline}
                    value={data?.deadline}
                    onInput={(e) => setData("deadline", e.target.value)}
                    type="datetime-local"
                />
                <input type="submit" disabled={processing} className="btn btn-primary" value="Create project" />
            </form>
        </div>
    );
};

export default CreateProjectForm;

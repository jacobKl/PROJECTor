import "./styles.scss";
import { useForm } from "@inertiajs/react";
import React from "react";
import Input from "../Input";
import Select from "../Select";

const OPTIONS = [
    { value: "full_access", textValue: "Full access" },
    { value: "read_only", textValue: "Read only" },
];

const InviteParticipantForm = ({ projectId }) => {
    const { data, setData, post, processing, errors } = useForm({
        project_id: projectId,
        email: "",
        permissions: "full_access",
    });

    const submit = (e) => {
        e.preventDefault();
        post("/project-participant");
    };

    const handleSelect = (e) => {
        setData("permissions", e.target.value);
    };

    return (
        <div className="invite-participant-form card">
            <h4>Invite collaborator</h4>

            <form onSubmit={submit}>
                <Input
                    placeholder="Collaborator e-mail"
                    name="email"
                    type="email"
                    label="Collaborator e-mail"
                    value={data?.email}
                    onInput={(e) => setData("email", e.target.value)}
                    error={errors?.email}
                />

                <Select
                    label="Permissions"
                    name="permissions"
                    callback={handleSelect}
                    options={OPTIONS}
                />

                <div className="invite-participant-form__button">
                    <input
                        className="btn btn-primary"
                        type="submit"
                        blocked={processing}
                        value="Invite"
                    />
                </div>
            </form>
        </div>
    );
};

export default InviteParticipantForm;

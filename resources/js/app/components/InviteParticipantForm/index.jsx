import { useForm } from '@inertiajs/react';
import React from 'react'
import Input from "../Input";

const InviteParticipantForm = ({projectId}) => {

    const { data, setData, post, processing, errors } = useForm({
        project_id: projectId,
        email: ""
    });

    const submit = (e) => {
        e.preventDefault();

        post("/project-participant");
    };

    return (
        <form onSubmit={submit}>
            <Input name="email" type="email" value={data?.email} onInput={e => setData("email", e.target.value)} error={errors?.email} />
            <input type="submit" />
        </form>
    );
}

export default InviteParticipantForm;

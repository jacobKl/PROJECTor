import "./styles.scss";
import { useForm } from '@inertiajs/react';
import React from 'react'
import Input from "../Input";

const InviteParticipantForm = ({projectId}) => {

    const { data, setData, post, processing, errors } = useForm({
        project_id: projectId,
        email: "",
        permissions: "full_access"
    });

    const submit = (e) => {
        e.preventDefault();
        post("/project-participant");
    };

    return (
        <div className="invite-participant-form">
            <h3>Invite collaborator</h3>
            <form onSubmit={submit}>
                <Input placeholder="User email" name="email" type="email" value={data?.email} onInput={e => setData("email", e.target.value)} error={errors?.email} />
                <select name="permissions" onChange={e => setData("permissions", e.target.value)}>
                    <option value="full_access">Full access</option>
                    <option value="read_only">Read only</option>
                </select>
                <input className="btn btn-primary" type="submit" blocked={processing} />
            </form>
        </div>
    );
}

export default InviteParticipantForm;

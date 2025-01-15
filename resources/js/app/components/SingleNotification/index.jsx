import "./styles.scss";
import React, { useState } from "react";
import { usePage } from '@inertiajs/react'
import { router } from '@inertiajs/react'

const SingleNotification = ({ message, created_at, type, data, id, setShowNotifications }) => {
    return (
        <div className="single-notification">
            <div>
                <p className="single-notification-message">{message}</p>
                <p className="single-notification-created">{created_at}</p>
            </div>
            <div>
                <Actions type={type} data={data} id={id} setShowNotifications={setShowNotifications}  />
            </div>
        </div>
    );
};

const getHandler = (type) => {
    const page = usePage()

    switch(type) {
        case "PROJECT_INVITATION":
            return async (data, id) => {
                const formData = new FormData();
                formData.append("invitation_id", data.invitation_id)
                formData.append("notification_id", id)

                const response = await fetch("/join-project", {
                    method: "POST",
                    body: formData,
                    headers: { 'X-CSRF-TOKEN': page.props.csrf_token }
                });

                const json = await response.json();

                if (json.errors) {
                    alert(json.errors);
                }
            }
    }
}

const Actions = ({ type, data, id, setShowNotifications }) => {
    const handler = getHandler(type);

    const go = () => {
        setShowNotifications(false);
        handler(data, id);
        router.visit(`/projects/${data.project_id}`);
    }

    return <button className="btn btn-primary" onClick={go}>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>
    </button>;
};

export default SingleNotification;

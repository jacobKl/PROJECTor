import React from "react";
import { usePage } from '@inertiajs/react'

const SingleNotification = ({ message, created_at, type, data, id }) => {
    return (
        <div className="single-notification">
            <div>
                <p>{message}</p>
                <p>{created_at}</p>
            </div>
            <Actions type={type} data={data} id={id}  />
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
            }
    }
}

const Actions = ({ type, data, id }) => {
    const handler = getHandler(type);

    return <button onClick={() => handler(data, id)}>join</button>;
};

export default SingleNotification;

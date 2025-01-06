import "./styles.scss";
import React, { useState } from "react";
import { useNotificationsPooling } from "../../hooks/useNotificationsPooling.js";
import SingleNotification from "../SingleNotification"

const Notifications = () => {
    const { notifications } = useNotificationsPooling();
    const [showNotifications, setShowNotifications] = useState(false);

    return (
        <div className="notifications">
            <button
                className="notifications-button"
                onClick={() => setShowNotifications(!showNotifications)}
            >
                {notifications && (
                    <div className="notifications-button-amount">
                        {notifications?.length}
                    </div>
                )}
                <i className="fa-regular fa-bell"></i>
            </button>
            {showNotifications && <div className="notifications-window">
                {notifications.map((singleNotification, ix) => (
                    <SingleNotification key={ix} {...singleNotification} />
                ))}
            </div>}
        </div>
    );
};

export default Notifications;

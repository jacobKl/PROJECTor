import { useEffect, useState } from "react";

const POOLING_DELAY = 15;

export const useNotificationsPooling = () => {
    const [notifications, setNotifications] = useState();

    useEffect(() => {
        const poolingHandler = async () => {
            try {
                const response = await fetch("/notifications");
                const json = await response.json();

                setNotifications(json.notifications);
            } catch (error) {
                console.log(new Error(error));
                return;
            }
        };

        const poolingInterval = setInterval(
            poolingHandler,
            POOLING_DELAY * 1000
        );

        poolingHandler();

        return () => clearInterval(poolingInterval);
    }, []);

    return { notifications };
};

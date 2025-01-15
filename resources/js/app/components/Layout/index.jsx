import "../../scss/root.scss";
import "./styles.scss";

import { clsx } from "clsx";
import React, { useState } from "react";
import { Link, usePage } from "@inertiajs/react";
import Notifications from "../Notifications";
import { router } from "@inertiajs/react";

const Layout = ({ children, mainClass, showAside = true }) => {
    const { url } = usePage();
    const [isMenuToggled, setIsMenuToggled] = useState(false);

    const handleLogout = () => {
        router.post('/logout', {}, {
            onFinish: () => {
                console.log('Logged out successfully');
            },
            onError: (error) => {
                console.error('Logout failed:', error);
            },
        });
    };

    const URLS = [
        {
            href: "/",
            text: "Dashboard",
            icon: "fa-solid fa-table-columns",
        },
        {
            href: "/tasks",
            text: "Tasks",
            icon: "fa-solid fa-list-check",
        },
        {
            href: "/projects",
            text: "Projects",
            icon: "fa-solid fa-diagram-project",
        },
        {
            icon: "fa-solid fa-right-from-bracket",
            text: "Logout",
            onClick: handleLogout,
        },
    ];

    return (
        <>
            {showAside && (
                <aside className="aside aside-full">
                    <div className="aside-logo">
                        <img src="/projector.png" alt="Projector Logo" />
                    </div>

                    <ul
                        className={clsx(
                            "aside-menu",
                            isMenuToggled && "aside-menu-active"
                        )}
                    >
                        {URLS.map((single, ix) => (
                            <li
                                key={ix}
                                className={clsx(
                                    "aside-menu-item",
                                    url === single.href &&
                                        "aside-menu-item-active"
                                )}
                            >
                                {single.href ? (
                                    <Link href={single.href}>
                                        {single.icon && (
                                            <span className="aside-menu-item-icon">
                                                <i className={single.icon}></i>
                                            </span>
                                        )}
                                        <span className="aside-menu-item-text">
                                            {single.text}
                                        </span>
                                    </Link>
                                ) : (
                                    <button onClick={single.onClick}>
                                        {single.icon && (
                                            <span className="aside-menu-item-icon">
                                                <i className={single.icon}></i>
                                            </span>
                                        )}
                                        <span className="aside-menu-item-text">
                                            {single.text}
                                        </span>
                                    </button>
                                )}
                            </li>
                        ))}
                    </ul>

                    <div className="aside-footer">
                        <div
                            className="aside-footer-toggle"
                            onClick={() => setIsMenuToggled(!isMenuToggled)}
                        >
                            <Bars />
                        </div>
                        <Notifications />
                    </div>
                </aside>
            )}

            <main
                className={clsx("main", mainClass, showAside && "main-padded")}
            >
                {children}
            </main>
        </>
    );
};

const Bars = () => {
    return (
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
            <path d="M0 96C0 78.3 14.3 64 32 64l384 0c17.7 0 32 14.3 32 32s-14.3 32-32 32L32 128C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32l384 0c17.7 0 32 14.3 32 32s-14.3 32-32 32L32 288c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32L32 448c-17.7 0-32-14.3-32-32s14.3-32 32-32l384 0c17.7 0 32 14.3 32 32z" />
        </svg>
    );
};

export default Layout;

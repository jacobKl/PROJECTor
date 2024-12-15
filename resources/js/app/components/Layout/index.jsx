import "../../scss/root.scss";
import "./styles.scss";

import { clsx } from "clsx";
import React, { useState } from "react";
import { Link, usePage } from "@inertiajs/react";

const URLS = [
    {
        href: "/dashboard",
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
        href: "/entries",
        text: "Time entries",
        icon: "fa-solid fa-clock",
    },
];

const Layout = ({ children, mainClass, showAside = true }) => {
    const [fullSidebar, setFullSidebar] = useState(true);
    const { url } = usePage();

    return (
        <>
            {showAside && (
                <aside className={clsx("aside", fullSidebar && "aside-full")}>
                    <div className="aside-logo">
                        <img src="/projector.png" alt="Projector Logo" />
                    </div>

                    <ul className="aside-menu">
                        {URLS.map((single, ix) => (
                            <li
                                key={ix}
                                className={clsx(
                                    "aside-menu-item",
                                    url === single.href &&
                                        "aside-menu-item-active"
                                )}
                            >
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
                            </li>
                        ))}
                    </ul>

                    <div className="aside-footer">
                        <button
                            onClick={() => setFullSidebar(!fullSidebar)}
                        >
                            +
                        </button>
                    </div>
                </aside>
            )}
            <main className={clsx(mainClass, showAside && "main-padded")}>{children}</main>
        </>
    );
};

export default Layout;

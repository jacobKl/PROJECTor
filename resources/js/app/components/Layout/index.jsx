import "../../scss/root.scss";
import "./styles.scss";

import React from "react";

const Layout = ({
    children,
    mainClass,
    showFooter = true,
    showHeader = true,
}) => {
    return (
        <>
            <header></header>
            <main className={mainClass}>{children}</main>
            <footer></footer>
        </>
    );
};

export default Layout;

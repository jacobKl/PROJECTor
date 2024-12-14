import React from "react";
import Layout from "../../app/components/Layout";

const DashboardPage = () => {
    return <h1>Dashboard page</h1>;
};

DashboardPage.layout = (page) => (
    <Layout
        children={page}
        title="ProjectOR | Dashboard"
        mainClass={"dashboard-page"}
    />
);

export default DashboardPage;

import React from "react";
import Layout from "../../app/components/Layout";

const DashboardPage = () => {
    return <h3>Dashboard page</h3>;
};

DashboardPage.layout = (page) => (
    <Layout
        children={page}
        title="ProjectOR | Dashboard"
        mainClass={"dashboard-page"}
    />
);

export default DashboardPage;

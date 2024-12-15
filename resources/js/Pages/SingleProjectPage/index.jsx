import React from "react";
import Layout from "../../app/components/Layout";

const SingleProjectPage = ({project}) => {
    return (
        <div>{project.name}</div>
    );
};

SingleProjectPage.layout = (page) => (
    <Layout
        children={page}
        title="Projector | project"
        mainClass={"project-page"}
    />
);

export default SingleProjectPage;

import React from "react";
import Layout from "../../app/components/Layout";
import InviteParticipantForm from "../../app/components/InviteParticipantForm";

const SingleProjectPage = ({project}) => {
    return (
        <div>
            <InviteParticipantForm projectId={project.id} />
        </div>
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

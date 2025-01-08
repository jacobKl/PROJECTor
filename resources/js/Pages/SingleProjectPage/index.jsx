import React from "react";
import Layout from "../../app/components/Layout";
import InviteParticipantForm from "../../app/components/InviteParticipantForm";
import { useProjectPermission } from "../../app/hooks/useProjectPermission";

const SingleProjectPage = ({project}) => {

    const { isAdmin } = useProjectPermission();

    return (
        <div>
            {isAdmin && <InviteParticipantForm projectId={project.id} />}
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

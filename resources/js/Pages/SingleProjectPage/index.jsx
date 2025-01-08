import React from "react";

import { useProjectPermission } from "../../app/hooks/useProjectPermission";

import Layout from "../../app/components/Layout";
import InviteParticipantForm from "../../app/components/InviteParticipantForm";
import TasksList from "../../app/components/TasksList";

const SingleProjectPage = ({ project, tasks }) => {

    const { admin, fullAccess, readOnly  } = useProjectPermission();

    return (
        <div>
            {admin && <InviteParticipantForm projectId={project.id} />}
            {(admin || fullAccess || readOnly) && <TasksList projectId={project.id} />}
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

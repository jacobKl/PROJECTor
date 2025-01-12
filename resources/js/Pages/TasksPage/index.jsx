import React from "react";

import { useProjectPermission } from "../../app/hooks/useProjectPermission";

import Layout from "../../app/components/Layout";
import TasksList from "../../app/components/TasksList";

const TasksPage = ({ assigned_to_user }) => {

    return (
        <>
            <h3>Your tasks ({assigned_to_user.length})</h3>
            <TasksList tasks={assigned_to_user} />
        </>
    );
};

TasksPage.layout = (page) => (
    <Layout
        children={page}
        title="Projector | Tasks"
        mainClass={"task-page"}
    />
);

export default TasksPage;

import "./styles.scss";
import React from "react";

import Layout from "../../app/components/Layout";
import EditTaskForm from "../../app/components/EditTaskForm";
import Thread from "../../app/components/Thread";

const TaskPage = () => {


    return (
        <>
            <EditTaskForm />
            <Thread />
        </>
    );
};

TaskPage.layout = (page) => (
    <Layout
        children={page}
        title="ProjectOR | Edit task"
        showAside={true}
        mainClass={"task-page"}
    />
);

export default TaskPage;

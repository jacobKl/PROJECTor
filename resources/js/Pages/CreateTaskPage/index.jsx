import "./styles.scss";
import React from "react";
import { useForm } from "@inertiajs/react";

import Layout from "../../app/components/Layout";
import CreateTaskForm from "../../app/components/CreateTaskForm";

const CreateTaskPage = ({ projectId, asigneesArray }) => {
    const { data, setData, post, processing, errors } = useForm({
        project_id: projectId,
        name: "",
        due_date: "",
        asignee: "",
        priority: "normal",
        description: "",
    });

    return (
        <>
            <div>
                <CreateTaskForm
                    data={data}
                    setData={setData}
                    post={post}
                    errors={errors}
                    asignees={asigneesArray}
                    projectId={projectId}
                />
            </div>
            <div>2</div>
        </>
    );
};

CreateTaskPage.layout = (page) => (
    <Layout
        children={page}
        title="ProjectOR | Create task"
        mainClass={"create-task-page"}
    />
);

export default CreateTaskPage;

import "./styles.scss";
import React, { useState } from "react";

import { useForm } from "@inertiajs/react";
import { PRIORITIES, STATUSES } from "../../app/components/CreateTaskForm";

import Input from "../../app/components/Input";
import Select from "../../app/components/Select";
import Layout from "../../app/components/Layout";

const TaskPage = ({task, asignees}) => {
    const [ used, setUsed ] = useState(false);

    const { data, errors, post, setData } = useForm({
        priority: task.priority,
        due_date: task.due_date,
        asignee: task.asignee?.value,
        status: task.status,
        description: task.description
    });

    const handleSelect = (name, event) => {
        const value = event.target.options[event.target.options.selectedIndex].value;
        setData(name, value);
    }

    const edit = () => {
        post(`/tasks/${task.id}`);
    }

    return (
        <>
            <div className="card task">
                <h2 className="task-name">{task.name}</h2>
                <p className="task-meta">
                    Last modified {task.updated_at}.
                </p>

                <form onChange={() => setUsed(true)}>
                    <div className="task-editable-row">
                        <Select error={errors?.priority} value={data?.priority} options={PRIORITIES} callback={(e) => handleSelect("priority", e)} name="priority" label="Priority" selected={data.priority} />
                        <Input error={errors?.due_date} value={data?.due_date} type="datetime-local" label="Due date" name="due_date" onInput={e => setData('due_date', e.target.value)} />
                        <Select error={errors?.asignee} value={data?.asignee} options={asignees} callback={(e) => handleSelect("asignee", e)} name="asignee" label="Asignee" selected={data.asignee} />
                        <Select error={errors?.status} options={STATUSES} callback={(e) => handleSelect("status", e)} name="status" label="Status" selected={data?.status} />
                    </div>

                    <div>
                        <h4 className="task-description-header">Description</h4>
                        <Input error={errors?.due_date} type="textarea" name="description" value={data?.description} onInput={e => setData('description', e.target.value)} />
                    </div>
                </form>

                {used && <button onClick={edit} className="btn btn-primary task-edit">Save</button>}
            </div>

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

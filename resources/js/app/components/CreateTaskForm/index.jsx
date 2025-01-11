import "./styles.scss";
import React from 'react'
import Input from '../Input';
import Select from '../Select';

export const PRIORITIES = [
    {value: "normal", textValue: "Normal"},
    {value: "high", textValue: "High"},
    {value: "urgent", textValue: "Urgent"},
];

export const STATUSES = [
    {value: "new", textValue: "New"},
    {value: "in-progress", textValue: "In Progress"},
    {value: "to-verification", textValue: "To verification"},
    {value: "closed", textValue: "Closed"},
]

const CreateTaskForm = ({ setData, data, errors, post, asignees, projectId }) => {

    const submit = (e) => {
        e.preventDefault();

        post(`/projects/${projectId}/task/create`, {
            onSuccess: () => router.visit("/projects/" + projectId),
        });
    };

    const handleSelect = (name, event) => {
        const value = event.target.options[event.target.options.selectedIndex].value;
        setData(name, value);
    }

    return (
        <>
            <h3>Creating new task</h3>
            <form onSubmit={submit} className="create-task-form">
                <Input error={errors?.name} placeholder="Enter task name" label="Task name" name="name" value={data.name} onInput={e => setData('name', e.target.value)} />
                <Input error={errors?.due_date} type="datetime-local" label="Due date" name="due_date" value={data.due_date} onInput={e => setData('due_date', e.target.value)} />
                <Select error={errors?.asignee} options={asignees} callback={(e) => handleSelect("asignee", e)} name="asignee" label="Asignee" selected={data.asignee} />
                <Select error={errors?.priority} options={PRIORITIES} callback={(e) => handleSelect("priority", e)} name="priority" label="Priority" selected={data.priority} />
                <Select error={errors?.status} options={STATUSES} callback={(e) => handleSelect("status", e)} name="status" label="Status" selected={data.status} />
                <Input error={errors?.description} type="textarea" rows={10} label="Description" placeholder="Description" value={data.description} onInput={e => setData('description', e.target.value)} />

                <button type="submit" className="btn btn-primary">Create task</button>
            </form>
        </>
    );
}

export default CreateTaskForm;

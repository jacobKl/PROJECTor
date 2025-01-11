import "./styles.scss"
import React from 'react'

import { Link } from "@inertiajs/react";

const statusParser = (status) => {
    switch(status) {
        case "new":
            return "New"
        case "in-progress":
            return "In Progress"
        case "to-verification":
            return "To verification"
        case "closed":
            return "Closed"
    }

    return "";
}

export const TaskItemHeader = () => {
    return (
        <div className="task-item-header task-item">
            <div>Title</div>
            <div>Asignee</div>
            <div>Priority</div>
            <div>Status</div>
            <div>Due</div>
            <div>Updated</div>
        </div>
    );
}

const TaskItem = ({ single }) => {
    return (
        <Link href={`/tasks/${single.id}`} className="task-item">
            <div>{single.name}</div>
            <div>{single?.asignee?.name}</div>
            <div>{single.priority}</div>
            <div>{statusParser(single.status)}</div>
            <div>{single.due_date}</div>
            <div>{single.updated_at}</div>
        </Link>
    );
}

export default TaskItem;

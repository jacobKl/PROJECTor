import "./styles.scss";
import React from "react";
import { Link } from "@inertiajs/react";

import { useProjectPermission } from "../../hooks/useProjectPermission";

import TaskItem, { TaskItemHeader } from "../TaskItem";

const TasksList = ({ projectId, tasks }) => {
    const { admin, fullAccess } = useProjectPermission();

    return (
        <div className="task-list">
            {projectId && (
                <div className="task-list__header-row">
                    <h3>All tasks</h3>

                    {(admin || fullAccess) && (
                        <Link
                            className="btn btn-primary"
                            href={`/projects/${projectId}/task/create`}
                        >
                            Create task
                        </Link>
                    )}
                </div>
            )}
            <div>
                <TaskItemHeader />

                {tasks.map((single, ix) => (
                    <TaskItem single={single} key={ix} />
                ))}
            </div>
        </div>
    );
};

export default TasksList;

import "./styles.scss";
import { Link } from "@inertiajs/react";
import React from "react";
import { useProjectPermission } from "../../hooks/useProjectPermission";

const TasksList = ({ projectId }) => {
    const { admin, fullAccess } = useProjectPermission();

    return (
        <div className="task-list">
            <div className="task-list__header-row">
                <h3>All tasks</h3>

                {(admin || fullAccess) && <Link className="btn btn-primary" href={`/projects/${projectId}/task/create`}>Create task</Link>}
            </div>
        </div>
    );
};

export default TasksList;

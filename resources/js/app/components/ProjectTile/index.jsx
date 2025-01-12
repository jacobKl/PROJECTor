import "./styles.scss";
import React from "react";
import { Link } from "@inertiajs/react";
import UserIcon from "../UserIcon";

const ProjectTile = ({ id, name, description, deadline, participants, task_count }) => {
    return (
        <Link className="card project-tile" href={`/projects/${id}`}>
            <div class="project-tile-row">
                <div>
                    <h5 className="project-tile-title">{name}</h5>
                    <p className="project-tile-deadline">Deadline: {deadline}</p>
                </div>
                <div>
                    <div className="project-tile-participants">
                        <UserIcon /> {participants}
                    </div>
                </div>
            </div>
            <p className="project-tile-description">{description}</p>

            <div className="project-tile-numbers">
                <AmountBox amount={task_count.new} label="New" />
                <AmountBox amount={task_count['in-progress']} style="in-progress" label="In progress" />
                <AmountBox amount={task_count['to-verification']} style="to-verification" label="Verification" />
                <AmountBox amount={task_count['closed']} style="closed" label="Closed" />
            </div>
        </Link>
    );
};


const AmountBox = ({ amount, style = "new", label }) => {
    return (
        <div className={`project-tile-amount project-tile-amount-${style}`}>
            <span className="project-tile-amount-span">{label}</span>: {amount}
        </div>
    );
}

export default ProjectTile;

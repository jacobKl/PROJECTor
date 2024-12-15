import "./styles.scss";
import React from "react";
import { Link } from "@inertiajs/react";

const ProjectTile = ({ id, name, description, deadline }) => {
    return (
        <Link className="card project-tile" href={`/projects/${id}`}>
            <div>
                <div>
                    <h5 className="project-tile-title">{name}</h5>
                    <p className="project-tile-deadline">Deadline: {deadline}</p>
                </div>
            </div>
            <p className="project-tile-description">{description}</p>
        </Link>
    );
};

export default ProjectTile;

import "./styles.scss";
import React from "react";
import Layout from "../../app/components/Layout";
import CreateProjectForm from "../../app/components/CreateProjectForm";
import { Link } from "@inertiajs/react";

const ProjectsPage = ({ userProjects = [] }) => {
    console.log(userProjects);

    return (
        <>
            {userProjects.length && (<div className="projects-grid">
                {userProjects.map((single,ix) => (
                    <Link key={ix} className="card projects-grid-project" href={`/projects/${single.id}`}>
                        <h5>{single.name}</h5>
                        <p>{single.description}</p>
                    </Link>
                ))}
            </div>)}
            <CreateProjectForm />
        </>
    );
};

ProjectsPage.layout = (page) => (
    <Layout
        children={page}
        title="Projector | Projects"
        mainClass={"projects-page"}
    />
);

export default ProjectsPage;

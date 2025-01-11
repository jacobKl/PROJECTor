import "./styles.scss";
import React from "react";
import Layout from "../../app/components/Layout";
import ProjectTile from "../../app/components/ProjectTile";
import CreateProjectForm from "../../app/components/CreateProjectForm";

const ProjectsPage = ({ userProjects = [] }) => {
    return (
        <>
            {userProjects.length ? (
                <div className="projects-grid">
                    {userProjects.map((single, ix) => <ProjectTile key={ix} {...single} />)}
                </div>
            ) : null}
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

package com.wissen.eima.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.wissen.eima.model.project.Project;

@RepositoryRestResource(path = "projects")
public interface ProjectRepository extends JpaRepository<Project, Integer> {

}

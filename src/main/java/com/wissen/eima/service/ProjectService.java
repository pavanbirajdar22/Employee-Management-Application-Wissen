package com.wissen.eima.service;

import java.util.Date;
import java.util.List;

import com.wissen.eima.model.project.Project;

public interface ProjectService {

	List<Project> getNewProjects(final Date startDate, final Date endDate);

	List<Project> getCompletedProjects(final Date startDate, final Date endDate);

}

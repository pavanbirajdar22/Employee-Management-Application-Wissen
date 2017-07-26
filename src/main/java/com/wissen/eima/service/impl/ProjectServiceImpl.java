package com.wissen.eima.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wissen.eima.model.project.Project;
import com.wissen.eima.repository.ProjectRepository;
import com.wissen.eima.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	ProjectRepository projectRepository;

	@Override
	public List<Project> getNewProjects(final Date startDate, final Date endDate) {
		return projectRepository.findByStartDateBetween(startDate, endDate);
	}

	@Override
	public List<Project> getCompletedProjects(final Date startDate, final Date endDate) {
		return projectRepository.findByEndDateBetween(startDate, endDate);
	}

}

package com.wissen.eima.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.wissen.eima.model.project.Project;
import com.wissen.eima.service.ProjectService;
@Service
public class ProjectServiceImpl implements ProjectService {

	@Override
	public List<Project> getNewProjects(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Project> getCompletedProjects(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

}

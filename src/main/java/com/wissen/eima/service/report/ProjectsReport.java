package com.wissen.eima.service.report;

import java.util.Date;
import java.util.List;

import com.wissen.eima.model.project.Project;

public interface ProjectsReport {
	List<Project> getReportForNewProjects(Date startDate,Date endDate);
	List<Project> getReportForCompletedProjects(Date startDate,Date endDate);
}

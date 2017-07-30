package com.wissen.eima.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.wissen.eima.model.project.Project;

@CrossOrigin(origins = "*")
public interface ProjectRepository extends JpaRepository<Project, Integer> {
	Project findByPid(final int pid);
	
	public List<Project> findByStartDateBetween(final Date fromDate, final Date toDate);

	public List<Project> findByEndDateBetween(final Date startDate, final Date endDate);

	public Project findByTitleContains(@Param(value = "title") final String title);
}

package com.wissen.eima.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wissen.eima.model.project.Project;

public interface ProjectRepository extends JpaRepository<Project, Integer> {
	public List<Project> findByStartDateBetween(final Date fromDate, final Date toDate);

	public List<Project> findByEndDateBetween(final Date startDate, final Date endDate);

	public Project findByTitle(final String title);
}

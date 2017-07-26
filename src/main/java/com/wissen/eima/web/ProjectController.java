package com.wissen.eima.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wissen.eima.model.project.Project;
import com.wissen.eima.service.impl.ProjectServiceImpl;

@RestController
@RequestMapping(value = "/project")
@CrossOrigin(origins = "*")
public class ProjectController {

	@Autowired
	ProjectServiceImpl projectServiceImpl;

	@RequestMapping(path = "/started", method = RequestMethod.GET)
	@ResponseBody
	List<Project> getProjectsStartedBetween(@RequestParam String fromDate, @RequestParam String toDate) {

		System.out.println("\nIn method getReportForEmployeesHired()...\n");

		System.out.println("\nstartDate = " + fromDate + "\n");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date sDate = null, eDate = null;
		try {
			sDate = formatter.parse(fromDate);
			eDate = formatter.parse(toDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		List<Project> reportForProjectsStarted = projectServiceImpl.getNewProjects(sDate, eDate);

		return reportForProjectsStarted;
	}

	@RequestMapping(path = "/completed", method = RequestMethod.GET)
	@ResponseBody
	List<Project> getProjectsCompletedBetween(@RequestParam String fromDate, @RequestParam String toDate) {

		System.out.println("\nIn method getReportForEmployeesHired()...\n");

		System.out.println("\nstartDate = " + fromDate + "\n");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date sDate = null, eDate = null;
		try {
			sDate = formatter.parse(fromDate);
			eDate = formatter.parse(toDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		List<Project> reportForProjectsCompleted = projectServiceImpl.getCompletedProjects(sDate, eDate);

		return reportForProjectsCompleted;
	}
}

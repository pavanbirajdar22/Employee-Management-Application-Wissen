package com.wissen.eima.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wissen.eima.model.project.Project;
import com.wissen.eima.service.impl.ProjectServiceImpl;

@RestController
@RequestMapping("/project")
public class ProjectController {
   
	@Autowired
	ProjectServiceImpl projectServiceImpl;
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	@RequestMapping("/newProjects")
	public List<Project> getNewProjects(@RequestParam String fromDate, @RequestParam String toDate) throws ParseException{
		return projectServiceImpl.getNewProjects(sdf.parse(fromDate), sdf.parse(toDate));
	}
	
	@RequestMapping("/CompletedProjects")
	public List<Project> getCompletedProjects(@RequestParam String fromDate, @RequestParam String toDate) throws ParseException{
		return projectServiceImpl.getCompletedProjects(sdf.parse(fromDate), sdf.parse(toDate));
	}
	
}

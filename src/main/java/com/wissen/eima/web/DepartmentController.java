package com.wissen.eima.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wissen.eima.model.department.Department;
import com.wissen.eima.service.impl.DepartmentServiceImpl;

@RestController
@RequestMapping("/department")
public class DepartmentController {

	@Autowired 
	DepartmentServiceImpl departmentServiceImpl;
	
	@RequestMapping("/departmentByName")
	public Department getDepartmentByName(@RequestParam("name") String name) {
		return departmentServiceImpl.getDepartmentByName(name);
	}
}

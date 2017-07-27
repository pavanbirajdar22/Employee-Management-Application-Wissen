package com.wissen.eima.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wissen.eima.model.EmployeeClient;
import com.wissen.eima.model.employee.Address;
import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.model.employee.Gender;
import com.wissen.eima.service.impl.EmployeeServiceImpl;
import com.wissen.eima.web.*;

@RestController
@RequestMapping(value = "/employee")
@CrossOrigin(origins = "*")
public class EmployeeController {

	@Autowired
	EmployeeServiceImpl employeeServiceImpl;

	@RequestMapping(path = "/create", method = RequestMethod.POST)
	@ResponseBody
	@CrossOrigin(origins = "*")
	int createEmployee(@RequestBody EmployeeReq empReq) {

		System.out.println(empReq);

		return employeeServiceImpl.createEmployee(empReq);

	}

	@RequestMapping(path = "/hired", method = RequestMethod.GET)
	@ResponseBody
	List<Employee> getEmployeesHired(@RequestParam String fromDate, @RequestParam String toDate) {

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

		List<Employee> reportForEmployeesHired = employeeServiceImpl.getEmployeesHired(sDate, eDate);

		System.out.println("\n" + reportForEmployeesHired + "\n");

		return reportForEmployeesHired;
	}

	@RequestMapping(path = "/left", method = RequestMethod.GET)
	@ResponseBody
	List<Employee> getEmployeesLeft(@RequestParam String fromDate, @RequestParam String toDate) {

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

		List<Employee> reportForEmployeesHired = employeeServiceImpl.getEmployeesLeft(sDate, eDate);

		System.out.println("\n" + reportForEmployeesHired + "\n");

		return reportForEmployeesHired;
	}

}

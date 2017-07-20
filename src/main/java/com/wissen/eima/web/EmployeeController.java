package com.wissen.eima.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.service.impl.EmployeeServiceImpl;

@RestController
@RequestMapping(value = "/employee")
public class EmployeeController {

	@Autowired
	EmployeeServiceImpl employeeServiceImpl;

	@RequestMapping(path = "/hired", method = RequestMethod.GET)
	@ResponseBody
	List<Employee> getEmployeesHired(@RequestParam String fromDate, @RequestParam String toDate) {

		System.out.println("\nIn method getReportForEmployeesHired()...\n");

		System.out.println("\nstartDate = " + fromDate + "\n");

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

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

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

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

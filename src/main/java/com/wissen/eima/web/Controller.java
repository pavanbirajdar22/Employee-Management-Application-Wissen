package com.wissen.eima.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.service.EmployeeService;
import com.wissen.eima.service.impl.EmployeeServiceImpl;

class Request {

	private String startDate;
	private String endDate;

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}

@RestController
@RequestMapping(value = "/report")
public class Controller {

	@Autowired
	EmployeeServiceImpl employeesReportGeneratorService;

	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	List<Employee> getReportForEmployeesHired(@RequestBody Request request) {

		System.out.println("\nIn method getReportForEmployeesHired()...\n");

		System.out.println("\nstartDate = " + request.getStartDate() + "\n");

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

		Date sDate = null, eDate = null;
		try {
			sDate = formatter.parse(request.getStartDate());
			eDate = formatter.parse(request.getEndDate());
		} catch (ParseException e) {
			e.printStackTrace();
		}

		List<Employee> reportForEmployeesHired = employeesReportGeneratorService.getEmployeesHired(sDate,
				eDate);

		System.out.println("\n" + reportForEmployeesHired + "\n");
		
		return reportForEmployeesHired;
	}

}

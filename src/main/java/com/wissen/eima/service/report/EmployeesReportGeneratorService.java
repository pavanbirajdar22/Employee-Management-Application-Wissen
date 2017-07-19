package com.wissen.eima.service.report;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.repository.EmployeeRepository;

@Service
public class EmployeesReportGeneratorService implements EmployeesReport {
	@Autowired
	EmployeeRepository employeeRepository;

	@Override
	public List<Employee> getReportForEmployeesHired(Date startDate, Date endDate) {
		return employeeRepository.findByJoiningDateBetween(startDate, endDate);	
	}

	@Override
	public List<Employee> getReportForEmployeesLeft(Date startDate, Date endDate) {
		return employeeRepository.findByJoiningDateBetween(startDate, endDate);
	}

}

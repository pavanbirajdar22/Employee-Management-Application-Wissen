package com.wissen.eima.service.report;

import java.util.Date;
import java.util.List;

import com.wissen.eima.model.employee.Employee;

public interface EmployeesReport {
	List<Employee> getReportForEmployeesHired(Date startDate,Date endDate);
	List<Employee> getReportForEmployeesLeft(Date startDate,Date endDate);
}

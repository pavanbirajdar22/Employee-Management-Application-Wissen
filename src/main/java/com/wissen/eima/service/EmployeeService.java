package com.wissen.eima.service;

import java.util.Date;
import java.util.List;

import com.wissen.eima.model.employee.Employee;

public interface EmployeeService {

	List<Employee> getEmployeesHired(final Date startDate, final Date endDate);

	List<Employee> getEmployeesLeft(final Date startDate, final Date endDate);

}

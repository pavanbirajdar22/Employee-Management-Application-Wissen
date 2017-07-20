package com.wissen.eima.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.repository.EmployeeRepository;
import com.wissen.eima.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeRepository employeeRepository;

	@Override
	public List<Employee> getEmployeesHired(final Date startDate, final Date endDate) {
		return employeeRepository.findByJoiningDateBetween(startDate, endDate);
	}

	@Override
	public List<Employee> getEmployeesLeft(final Date startDate, final Date endDate) {
		return employeeRepository.findByLeavingDateBetween(startDate, endDate);
	}

	@Override
	public Employee getEmployeeByFirstName(String firstName) {
		// TODO Auto-generated method stub
		return null;
	}

}

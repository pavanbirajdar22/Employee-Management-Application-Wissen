package com.wissen.eima.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wissen.eima.model.EmployeeClient;
import com.wissen.eima.model.EmployeeProject;
import com.wissen.eima.model.client.Client;
import com.wissen.eima.model.department.Department;
import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.model.project.Project;
import com.wissen.eima.repository.ClientRepository;
import com.wissen.eima.repository.DepartmentRepository;
import com.wissen.eima.repository.EmployeeRepository;
import com.wissen.eima.repository.ProjectRepository;
import com.wissen.eima.service.EmployeeService;
import com.wissen.eima.web.EmployeeReq;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeRepository employeeRepository;

	@Autowired
	ProjectRepository projectRepository;

	@Autowired
	ClientRepository clientRepository;

	@Autowired
	DepartmentRepository departmentRepository;

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
		return null;
	}

	@Override
	public int createEmployee(EmployeeReq empReq) {

		Employee emp = new Employee();
		Department department = departmentRepository.findByDeptId(empReq.getDeptId());
		emp.setDepartment(department);
		// Employee mgr = employeeRepository.findByEid(empReq.getMgrId());
		// emp.setManager(mgr);

		emp.setFirstName(empReq.getFirstName());
		emp.setMiddleName(empReq.getMiddleName());
		emp.setLastName(empReq.getLastName());

		emp.setDesignation(empReq.getDesignation());
		emp.setDob(empReq.getDob());
		emp.setSalary(empReq.getSalary());
		emp.setGender(empReq.getGender());
		emp.setPhoneNumber(empReq.getPhoneNumber());

		emp.setDob(empReq.getDob());
		emp.setJoiningDate(empReq.getJoiningDate());
		emp.setLeavingDate(empReq.getLeavingDate());

		Employee empNew = employeeRepository.saveAndFlush(emp);

		employeeRepository.insertIntoEmployeeClient(empNew.getEid(), empReq.getCid());
		employeeRepository.insertIntoEmployeeProject(empNew.getEid(), empReq.getPid());
		employeeRepository.insertIntoAddress(empReq.getAddress().getType(), empReq.getAddress().getLine1(),
				empReq.getAddress().getLine2(), empReq.getAddress().getCity(), empReq.getAddress().getState(),
				empReq.getAddress().getCountry(), empReq.getAddress().getPincode(), empNew.getEid());

		String pass = empReq.getFirstName() + "@" + empReq.getLastName();

		employeeRepository.insertIntoUser(empNew.getEid(), empReq.getEmailId(), pass);

		return empNew.getEid();
	}

}

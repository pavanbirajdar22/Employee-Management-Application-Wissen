package com.wissen.eima.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.wissen.eima.model.employee.Employee;

@CrossOrigin(origins="*")
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	Employee findByFirstName(String firstName);
	List<Employee> findByJoiningDateBetween(Date startDate,Date endDate);
	List<Employee> findByLeavingDateBetween(Date startDate,Date endDate);
}

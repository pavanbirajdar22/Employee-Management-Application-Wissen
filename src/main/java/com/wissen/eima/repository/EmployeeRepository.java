package com.wissen.eima.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.wissen.eima.model.employee.Employee;

@CrossOrigin(origins = "*")
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	Employee findByFirstName(final String firstName);

	List<Employee> findByJoiningDateBetween(final Date startDate, final Date endDate);

	List<Employee> findByLeavingDateBetween(final Date startDate, final Date endDate);

}

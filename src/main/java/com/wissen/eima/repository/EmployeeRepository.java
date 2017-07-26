package com.wissen.eima.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.wissen.eima.model.employee.Employee;

@CrossOrigin(origins = "*")
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	Employee findByFirstNameContains(@Param("firstName") final String firstName);
	Employee findByLastNameContains(@Param("lastName") final String lastName);
	Employee findByEid(@Param("eid") int eid);
	List<Employee> findByJoiningDateBetween(final Date startDate, final Date endDate);
	List<Employee> findByLeavingDateBetween(final Date startDate, final Date endDate);

}

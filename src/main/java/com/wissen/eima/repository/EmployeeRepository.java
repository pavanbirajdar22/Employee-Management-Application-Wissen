package com.wissen.eima.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.wissen.eima.model.employee.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	Employee findByFirstName(String firstName);
}

package com.wissen.eima.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.wissen.eima.model.department.Department;

@RepositoryRestResource(path="departments")
public interface DepartmentRepository extends JpaRepository<Department, Integer> {

}

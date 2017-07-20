package com.wissen.eima.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.wissen.eima.model.department.Department;

@CrossOrigin(origins = "*")
public interface DepartmentRepository extends JpaRepository<Department, Integer> {
	Department findByDeptName(final String name);
}

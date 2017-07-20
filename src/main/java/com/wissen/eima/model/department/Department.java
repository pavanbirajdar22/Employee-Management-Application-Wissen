package com.wissen.eima.model.department;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.model.project.Project;

/**
 * The persistent class for the Department database table.
 * 
 */
@Entity
public class Department implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "dept_id")
	private int deptId;

	@Column(name = "dept_name")
	private String deptName;

	// bi-directional many-to-one association to Employee
	@JsonIgnoreProperties({ "addresses", "staff", "manager", "projects", "clients", "employeeClients",
			"employeeProjects", "department", "histories", "user" })
	@OneToMany(mappedBy = "department")
	private List<Employee> employees;

	// bi-directional many-to-one association to Project
	@JsonIgnoreProperties({ "team", "employeeProjects", "client", "department" })
	@OneToMany(mappedBy = "department")
	private List<Project> projects;

	public Department() {
	}

	public int getDeptId() {
		return this.deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public List<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public Employee addEmployee(Employee employee) {
		getEmployees().add(employee);
		employee.setDepartment(this);

		return employee;
	}

	public Employee removeEmployee(Employee employee) {
		getEmployees().remove(employee);
		employee.setDepartment(null);

		return employee;
	}

	public List<Project> getProjects() {
		return this.projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public Project addProject(Project project) {
		getProjects().add(project);
		project.setDepartment(this);

		return project;
	}

	public Project removeProject(Project project) {
		getProjects().remove(project);
		project.setDepartment(null);

		return project;
	}

}
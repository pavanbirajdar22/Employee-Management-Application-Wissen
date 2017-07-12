package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Department database table.
 * 
 */
@Entity
@NamedQuery(name="Department.findAll", query="SELECT d FROM Department d")
public class Department implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="dept_id")
	private int deptId;

	@Column(name="dept_name")
	private String deptName;

	//bi-directional many-to-one association to Employee
	@OneToMany(mappedBy="department")
	private List<Employee> employees;

	//bi-directional many-to-one association to Project
	@OneToMany(mappedBy="department")
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
package com.wissen.eima.model.project;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.rest.core.annotation.RestResource;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.wissen.eima.model.EmployeeProject;
import com.wissen.eima.model.client.Client;
import com.wissen.eima.model.department.Department;
import com.wissen.eima.model.employee.Employee;

/**
 * The persistent class for the Project database table.
 * 
 */
@Entity
@NamedQuery(name = "Project.findAll", query = "SELECT p FROM Project p")
public class Project implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int pid;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "end_date")
	private Date endDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "start_date")
	private Date startDate;

	private String title;

	// bi-directional many-to-many association to Employee
	@JsonIgnoreProperties({ "addresses", "staff", "manager", "projects", "clients", "employeeClients",
			"employeeProjects", "department", "histories", "user" })
	@ManyToMany(mappedBy = "projects")
	private List<Employee> team;

	// bi-directional many-to-one association to Employee_Project
	@JsonIgnoreProperties({ "employee", "project" })
	@OneToMany(mappedBy = "project")
	private List<EmployeeProject> employeeProjects;

	// bi-directional many-to-one association to Client
	@JsonIgnoreProperties({ "employees", "projects", "clientEmployees" })
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "cid")
	@RestResource(exported = false)
	private Client client;

	// bi-directional many-to-one association to Department
	@JsonIgnoreProperties({ "employees", "projects" })
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "dept_id")
	@RestResource(exported = false)
	private Department department;

	public Project() {
	}

	public int getPid() {
		return this.pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Employee> getTeam() {
		return this.team;
	}

	public void setTeam(List<Employee> team) {
		this.team = team;
	}

	public List<EmployeeProject> getEmployeeProjects() {
		return this.employeeProjects;
	}

	public void setEmployeeProjects(List<EmployeeProject> employeeProjects) {
		this.employeeProjects = employeeProjects;
	}

	public EmployeeProject addEmployeeProject(EmployeeProject employeeProject) {
		getEmployeeProjects().add(employeeProject);
		employeeProject.setProject(this);

		return employeeProject;
	}

	public EmployeeProject removeEmployeeProject(EmployeeProject employeeProject) {
		getEmployeeProjects().remove(employeeProject);
		employeeProject.setProject(null);

		return employeeProject;
	}

	public Client getClient() {
		return this.client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

}
package com.wissen.eima.model.client;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.wissen.eima.model.EmployeeClient;
import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.model.project.Project;

/**
 * The persistent class for the Client database table.
 * 
 */
@Entity
public class Client implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int cid;

	private String location;

	private String name;

	private String description;
	
	// bi-directional many-to-many association to Employee
	@JsonIgnoreProperties({ "addresses", "staff", "manager", "projects", "clients", "employeeClients",
			"employeeProjects", "department", "histories", "user" })
	@ManyToMany(mappedBy = "clients")
	private List<Employee> employees;

	// bi-directional many-to-one association to Employee_Client
	@JsonIgnoreProperties({ "client", "employee" })
	@OneToMany(mappedBy = "client")
	private List<EmployeeClient> clientEmployees;

	// bi-directional many-to-one association to Project
	@JsonIgnoreProperties({ "team", "employeeProjects", "client", "department" })
	@OneToMany(mappedBy = "client")
	private List<Project> projects;

	public Client() {
	}

	public int getCid() {
		return this.cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public List<EmployeeClient> getClientEmployees() {
		return this.clientEmployees;
	}

	public void setClientEmployees(List<EmployeeClient> employeeClients) {
		this.clientEmployees = employeeClients;
	}

	public EmployeeClient addClientEmployees(EmployeeClient clientEmployees) {
		getClientEmployees().add(clientEmployees);
		clientEmployees.setClient(this);

		return clientEmployees;
	}

	public EmployeeClient removeClientEmployees(EmployeeClient clientEmployees) {
		getClientEmployees().remove(clientEmployees);
		clientEmployees.setClient(null);

		return clientEmployees;
	}

	public List<Project> getProjects() {
		return this.projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public Project addProject(Project project) {
		getProjects().add(project);
		project.setClient(this);

		return project;
	}

	public Project removeProject(Project project) {
		getProjects().remove(project);
		project.setClient(null);

		return project;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
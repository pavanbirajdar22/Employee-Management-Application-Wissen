package com.wissen.eima.model.client;

import java.io.Serializable;
import javax.persistence.*;

import com.wissen.eima.model.EmployeeClient;
import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.model.project.Project;

import java.util.List;


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

	//bi-directional many-to-many association to Employee
	@ManyToMany(mappedBy="clients")
	private List<Employee> employees;

	//bi-directional many-to-one association to Employee_Client
	@OneToMany(mappedBy="client")
	private List<EmployeeClient> clientEmployees;

	//bi-directional many-to-one association to Project
	@OneToMany(mappedBy="client")
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

}
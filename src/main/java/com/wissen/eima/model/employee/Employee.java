package com.wissen.eima.model.employee;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.wissen.eima.model.EmployeeClient;
import com.wissen.eima.model.EmployeeProject;
import com.wissen.eima.model.client.Client;
import com.wissen.eima.model.department.Department;
import com.wissen.eima.model.project.Project;

import java.util.Date;
import java.util.List;

/**
 * The persistent class for the Employee database table.
 * 
 */
@Entity
public class Employee implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int eid;

	private String designation;

	@Column(name = "first_name")
	private String firstName;

	private Gender gender;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "joining_date")
	private Date joiningDate;

	@Column(name = "last_name")
	private String lastName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "leaving_date")
	private Date leavingDate;

	@Column(name = "middle_name")
	private String middleName;

	@Column(name = "phone_number")
	private String phoneNumber;

	private double salary;

	// bi-directional many-to-one association to Address
	@OneToMany(mappedBy = "employee")
	private List<Address> addresses;

	// bi-directional many-to-many association to Client
	@ManyToMany
	@JoinTable(name = "Employee_Client", joinColumns = { @JoinColumn(name = "eid") }, inverseJoinColumns = {
			@JoinColumn(name = "cid") })
	private List<Client> clients;

	// bi-directional many-to-one association to Department
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dept_id")
	private Department department;

	// bi-directional many-to-one association to Employee
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mgr_eid")
	private Employee manager;

	// bi-directional many-to-one association to Employee
	@OneToMany(mappedBy = "manager")
	private List<Employee> staff;

	// bi-directional many-to-many association to Project
	@ManyToMany
	@JoinTable(name = "Employee_Project", joinColumns = { @JoinColumn(name = "eid") }, inverseJoinColumns = {
			@JoinColumn(name = "pid") })
	private List<Project> projects;

	// bi-directional many-to-one association to Employee_Client
	@OneToMany(mappedBy = "employee")
	private List<EmployeeClient> employeeClients;

	// bi-directional many-to-one association to Employee_Project
	@OneToMany(mappedBy = "employee")
	private List<EmployeeProject> employeeProjects;

	// bi-directional many-to-one association to History
	@OneToMany(mappedBy = "employee")
	private List<History> histories;

	// bi-directional one-to-one association to User
	@OneToOne(mappedBy = "employee", fetch = FetchType.LAZY)
	private User user;

	public Employee() {
	}

	public int getEid() {
		return this.eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getDesignation() {
		return this.designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public int getGender() {
		return this.gender.ordinal();
	}

	public void setGender(int gender) {
		this.gender = Gender.valueOf(String.valueOf(gender));
	}

	public Date getJoiningDate() {
		return this.joiningDate;
	}

	public void setJoiningDate(Date joiningDate) {
		this.joiningDate = joiningDate;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getLeavingDate() {
		return this.leavingDate;
	}

	public void setLeavingDate(Date leavingDate) {
		this.leavingDate = leavingDate;
	}

	public String getMiddleName() {
		return this.middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public double getSalary() {
		return this.salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public List<Address> getAddresses() {
		return this.addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public Address addAddress(Address address) {
		getAddresses().add(address);
		address.setEmployee(this);

		return address;
	}

	public Address removeAddress(Address address) {
		getAddresses().remove(address);
		address.setEmployee(null);

		return address;
	}

	public List<Client> getClients() {
		return this.clients;
	}

	public void setClients(List<Client> clients) {
		this.clients = clients;
	}

	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Employee getManager() {
		return this.manager;
	}

	public void setEmployee(Employee employee) {
		this.manager = employee;
	}

	public List<Employee> getStaff() {
		return this.staff;
	}

	public void setEmployees(List<Employee> employees) {
		this.staff = employees;
	}

	public Employee addEmployee(Employee employee) {
		getStaff().add(employee);
		employee.setEmployee(this);

		return employee;
	}

	public Employee removeEmployee(Employee employee) {
		getStaff().remove(employee);
		employee.setEmployee(null);

		return employee;
	}

	public List<Project> getProjects() {
		return this.projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public List<EmployeeClient> getEmployeeClients() {
		return this.employeeClients;
	}

	public void setEmployeeClients(List<EmployeeClient> employeeClients) {
		this.employeeClients = employeeClients;
	}

	public EmployeeClient addEmployeeClient(EmployeeClient employeeClient) {
		getEmployeeClients().add(employeeClient);
		employeeClient.setEmployee(this);

		return employeeClient;
	}

	public EmployeeClient removeEmployeeClient(EmployeeClient employeeClient) {
		getEmployeeClients().remove(employeeClient);
		employeeClient.setEmployee(null);

		return employeeClient;
	}

	public List<EmployeeProject> getEmployeeProjects() {
		return this.employeeProjects;
	}

	public void setEmployeeProjects(List<EmployeeProject> employeeProjects) {
		this.employeeProjects = employeeProjects;
	}

	public EmployeeProject addEmployeeProject(EmployeeProject employeeProject) {
		getEmployeeProjects().add(employeeProject);
		employeeProject.setEmployee(this);

		return employeeProject;
	}

	public EmployeeProject removeEmployeeProject(EmployeeProject employeeProject) {
		getEmployeeProjects().remove(employeeProject);
		employeeProject.setEmployee(null);

		return employeeProject;
	}

	public List<History> getHistories() {
		return this.histories;
	}

	public void setHistories(List<History> histories) {
		this.histories = histories;
	}

	public History addHistory(History history) {
		getHistories().add(history);
		history.setEmployee(this);

		return history;
	}

	public History removeHistory(History history) {
		getHistories().remove(history);
		history.setEmployee(null);

		return history;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
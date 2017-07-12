package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Employee database table.
 * 
 */
@Entity
@NamedQuery(name="Employee.findAll", query="SELECT e FROM Employee e")
public class Employee implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int eid;

	@Column(name="first_name")
	private String firstName;

	private int gender;

	@Column(name="last_name")
	private String lastName;

	@Column(name="middle_name")
	private String middleName;

	@Column(name="phone_number")
	private String phoneNumber;

	private double salary;

	//bi-directional many-to-one association to Address
	@OneToMany(mappedBy="employee")
	private List<Address> addresses;

	//bi-directional many-to-one association to Department
	@ManyToOne
	@JoinColumn(name="dept_id")
	private Department department;

	//bi-directional many-to-one association to Employee
	@ManyToOne
	@JoinColumn(name="mgr_eid")
	private Employee employee;

	//bi-directional many-to-one association to Employee
	@OneToMany(mappedBy="employee")
	private List<Employee> employees;

	//bi-directional many-to-one association to History
	@OneToMany(mappedBy="employee")
	private List<History> histories;

	//bi-directional many-to-one association to Serves_Client
	@OneToMany(mappedBy="employee")
	private List<Serves_Client> servesClients;

	//bi-directional many-to-one association to User
	@OneToMany(mappedBy="employee")
	private List<User> users;

	//bi-directional many-to-one association to Works_On_Project
	@OneToMany(mappedBy="employee")
	private List<Works_On_Project> worksOnProjects;

	public Employee() {
	}

	public int getEid() {
		return this.eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public int getGender() {
		return this.gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public List<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public Employee addEmployee(Employee employee) {
		getEmployees().add(employee);
		employee.setEmployee(this);

		return employee;
	}

	public Employee removeEmployee(Employee employee) {
		getEmployees().remove(employee);
		employee.setEmployee(null);

		return employee;
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

	public List<Serves_Client> getServesClients() {
		return this.servesClients;
	}

	public void setServesClients(List<Serves_Client> servesClients) {
		this.servesClients = servesClients;
	}

	public Serves_Client addServesClient(Serves_Client servesClient) {
		getServesClients().add(servesClient);
		servesClient.setEmployee(this);

		return servesClient;
	}

	public Serves_Client removeServesClient(Serves_Client servesClient) {
		getServesClients().remove(servesClient);
		servesClient.setEmployee(null);

		return servesClient;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User addUser(User user) {
		getUsers().add(user);
		user.setEmployee(this);

		return user;
	}

	public User removeUser(User user) {
		getUsers().remove(user);
		user.setEmployee(null);

		return user;
	}

	public List<Works_On_Project> getWorksOnProjects() {
		return this.worksOnProjects;
	}

	public void setWorksOnProjects(List<Works_On_Project> worksOnProjects) {
		this.worksOnProjects = worksOnProjects;
	}

	public Works_On_Project addWorksOnProject(Works_On_Project worksOnProject) {
		getWorksOnProjects().add(worksOnProject);
		worksOnProject.setEmployee(this);

		return worksOnProject;
	}

	public Works_On_Project removeWorksOnProject(Works_On_Project worksOnProject) {
		getWorksOnProjects().remove(worksOnProject);
		worksOnProject.setEmployee(null);

		return worksOnProject;
	}

}
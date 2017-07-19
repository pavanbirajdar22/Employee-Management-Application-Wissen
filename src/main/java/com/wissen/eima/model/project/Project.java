package com.wissen.eima.model.project;

import java.io.Serializable;
import javax.persistence.*;

import com.wissen.eima.model.EmployeeProject;
import com.wissen.eima.model.client.Client;
import com.wissen.eima.model.department.Department;
import com.wissen.eima.model.employee.Employee;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the Project database table.
 * 
 */
@Entity
@NamedQuery(name="Project.findAll", query="SELECT p FROM Project p")
public class Project implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int pid;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="end_date")
	private Date endDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="start_date")
	private Date startDate;

	private String title;

	//bi-directional many-to-many association to Employee
	@ManyToMany(mappedBy="projects")
	private List<Employee> employees;

	//bi-directional many-to-one association to Employee_Project
	@OneToMany(mappedBy="project")
	private List<EmployeeProject> team;

	//bi-directional many-to-one association to Client
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="cid")
	private Client client;

	//bi-directional many-to-one association to Department
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="dept_id")
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

	public List<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public List<EmployeeProject> getTeam() {
		return this.team;
	}

	public void setTeam(List<EmployeeProject> team) {
		this.team = team;
	}

	public EmployeeProject addTeam(EmployeeProject team) {
		getTeam().add(team);
		team.setProject(this);

		return team;
	}

	public EmployeeProject removeTeam(EmployeeProject team) {
		getTeam().remove(team);
		team.setProject(null);

		return team;
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
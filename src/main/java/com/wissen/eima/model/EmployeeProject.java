package com.wissen.eima.model;

import java.io.Serializable;
import javax.persistence.*;

import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.model.project.Project;

import java.util.Date;

/**
 * The persistent class for the Employee_Project database table.
 * 
 */
@Entity
@Table(name = "Employee_Project")
public class EmployeeProject implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private EmployeeProjectPK id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "end_date")
	private Date endDate;

	private String role;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "start_date")
	private Date startDate;

	// bi-directional many-to-one association to Employee
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "eid", insertable = false, updatable = false)
	private Employee employee;

	// bi-directional many-to-one association to Project
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "pid", insertable = false, updatable = false)
	private Project project;

	public EmployeeProject() {
	}

	public EmployeeProjectPK getId() {
		return this.id;
	}

	public void setId(EmployeeProjectPK id) {
		this.id = id;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

}
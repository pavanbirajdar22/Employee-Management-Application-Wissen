package com.wissen.eima.model;

import java.io.Serializable;
import javax.persistence.*;

import com.wissen.eima.model.client.Client;
import com.wissen.eima.model.employee.Employee;

import java.util.Date;

/**
 * The persistent class for the Employee_Client database table.
 * 
 */
@Entity
@Table(name = "Employee_Client")
public class EmployeeClient implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private EmployeeClientPK id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "end_date")
	private Date endDate;

	private String reason;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "start_date")
	private Date startDate;

	// bi-directional many-to-one association to Client
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cid", insertable = false, updatable = false)
	private Client client;

	// bi-directional many-to-one association to Employee
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "eid", insertable = false, updatable = false)
	private Employee employee;

	public EmployeeClient() {
	}

	public EmployeeClientPK getId() {
		return this.id;
	}

	public void setId(EmployeeClientPK id) {
		this.id = id;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Client getClient() {
		return this.client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}
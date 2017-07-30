package com.wissen.eima.model.employee;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the History database table.
 * 
 */
@Entity
@NamedQuery(name = "History.findAll", query = "SELECT h FROM History h")
public class History implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int hid;

	@Column(name = "field_changed")
	private String fieldChanged;

	@Column(name = "new_val")
	private String newVal;

	@Column(name = "old_val")
	private String oldVal;

	@Temporal(TemporalType.TIMESTAMP)
	private Date timestamp;

	// bi-directional many-to-one association to Employee
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "eid")
	private Employee employee;

	public History() {
	}

	public int getHid() {
		return this.hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public String getFieldChanged() {
		return this.fieldChanged;
	}

	public void setFieldChanged(String fieldChanged) {
		this.fieldChanged = fieldChanged;
	}

	public String getNewVal() {
		return this.newVal;
	}

	public void setNewVal(String newVal) {
		this.newVal = newVal;
	}

	public String getOldVal() {
		return this.oldVal;
	}

	public void setOldVal(String oldVal) {
		this.oldVal = oldVal;
	}

	public Date getTimestamp() {
		return this.timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}
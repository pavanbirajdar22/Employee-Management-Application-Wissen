package com.wissen.eima.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the Employee_Project database table.
 * 
 */
@Embeddable
public class EmployeeProjectPK implements Serializable {
	// default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable = false, updatable = false)
	private int eid;

	@Column(insertable = false, updatable = false)
	private int pid;

	public EmployeeProjectPK() {
	}

	public int getEid() {
		return this.eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public int getPid() {
		return this.pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof EmployeeProjectPK)) {
			return false;
		}
		EmployeeProjectPK castOther = (EmployeeProjectPK) other;
		return (this.eid == castOther.eid) && (this.pid == castOther.pid);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.eid;
		hash = hash * prime + this.pid;

		return hash;
	}
}
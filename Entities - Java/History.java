package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the History database table.
 * 
 */
@Entity
@NamedQuery(name="History.findAll", query="SELECT h FROM History h")
public class History implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int hid;

	@Column(name="field_changed")
	private String fieldChanged;

	@Column(name="new_val")
	private String newVal;

	@Column(name="old_val")
	private String oldVal;

	@Temporal(TemporalType.TIMESTAMP)
	private Date timestamp;

	//bi-directional many-to-one association to Employee
	@ManyToOne
	@JoinColumn(name="eid")
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
package com.wissen.eima.model.employee;

import java.io.Serializable;
import javax.persistence.*;

import com.wissen.eima.model.permission.Group;

import java.util.Date;


/**
 * The persistent class for the User database table.
 * 
 */
@Entity
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int eid;

	@Column(name="address_visible")
	private int addressVisible;

	@Column(name="dob_visible")
	private int dobVisible;

	@Column(name="email_id")
	private String emailId;

	@Column(name="gender_visible")
	private int genderVisible;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_login")
	private Date lastLogin;

	private String password;

	//bi-directional one-to-one association to Employee
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="eid")
	private Employee employee;

	//bi-directional many-to-one association to Group
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="gid")
	private Group group;

	public User() {
	}

	public int getEid() {
		return this.eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public int getAddressVisible() {
		return this.addressVisible;
	}

	public void setAddressVisible(int addressVisible) {
		this.addressVisible = addressVisible;
	}

	public int getDobVisible() {
		return this.dobVisible;
	}

	public void setDobVisible(int dobVisible) {
		this.dobVisible = dobVisible;
	}

	public String getEmailId() {
		return this.emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public int getGenderVisible() {
		return this.genderVisible;
	}

	public void setGenderVisible(int genderVisible) {
		this.genderVisible = genderVisible;
	}

	public Date getLastLogin() {
		return this.lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Group getGroup() {
		return this.group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

}
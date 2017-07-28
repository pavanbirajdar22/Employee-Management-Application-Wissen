package com.wissen.eima.web;

import java.util.Arrays;
import java.util.Date;

import com.wissen.eima.model.employee.Address;

public class EmployeeReq {
	
	
	@Override
	public String toString() {
		return "EmployeeReq [designation=" + designation + ", addresses=" + ", firstName="
				+ firstName + ", gender=" + gender + ", joiningDate=" + joiningDate + ", lastName=" + lastName
				+ ", leavingDate=" + leavingDate + ", middleName=" + middleName + ", phoneNumber=" + phoneNumber
				+ ", salary=" + salary + ", dob=" + dob + ", pid=" + pid + ", cid=" + cid + ", deptId=" + deptId + "]";
	}

	private String designation;
	
	private int mgrId;

	private Address address;
	
	private String emailId;
	
	private String password;

	private String firstName;

	private int gender;

	private Date joiningDate;

	private String lastName;

	private Date leavingDate;

	private String middleName;

	private String phoneNumber;

	private double salary;

	private Date dob;
	
	private int pid;
	
	private int cid;
	
	private int deptId;
	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(Date joiningDate) {
		this.joiningDate = joiningDate;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getLeavingDate() {
		return leavingDate;
	}

	public void setLeavingDate(Date leavingDate) {
		this.leavingDate = leavingDate;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	public int getMgrId() {
		return mgrId;
	}

	public void setMgrId(int mgrId) {
		this.mgrId = mgrId;
	}
}

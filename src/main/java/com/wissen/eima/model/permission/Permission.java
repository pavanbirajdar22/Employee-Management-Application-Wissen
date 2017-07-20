package com.wissen.eima.model.permission;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.wissen.eima.model.employee.User;

/**
 * The persistent class for the Permission database table.
 * 
 */
@Entity
public class Permission implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int eid;

	@Column(name = "add_client")
	private int addClient;

	@Column(name = "add_department")
	private int addDepartment;

	@Column(name = "add_employee")
	private int addEmployee;

	@Column(name = "add_project")
	private int addProject;

	@Column(name = "delete_user")
	private int deleteUser;

	@Column(name = "edit_client")
	private int editClient;

	@Column(name = "edit_department")
	private int editDepartment;

	@Column(name = "edit_employee")
	private int editEmployee;

	@Column(name = "edit_other_employee")
	private int editOtherEmployee;

	@Column(name = "edit_project")
	private int editProject;

	// bi-directional one-to-one association to User
	@JsonIgnoreProperties("permission")
	@OneToOne
	@JoinColumn(name = "eid")
	private User user;

	public Permission() {
	}

	public int getEid() {
		return this.eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public int getAddClient() {
		return this.addClient;
	}

	public void setAddClient(int addClient) {
		this.addClient = addClient;
	}

	public int getAddDepartment() {
		return this.addDepartment;
	}

	public void setAddDepartment(int addDepartment) {
		this.addDepartment = addDepartment;
	}

	public int getAddEmployee() {
		return this.addEmployee;
	}

	public void setAddEmployee(int addEmployee) {
		this.addEmployee = addEmployee;
	}

	public int getAddProject() {
		return this.addProject;
	}

	public void setAddProject(int addProject) {
		this.addProject = addProject;
	}

	public int getDeleteUser() {
		return this.deleteUser;
	}

	public void setDeleteUser(int deleteUser) {
		this.deleteUser = deleteUser;
	}

	public int getEditClient() {
		return this.editClient;
	}

	public void setEditClient(int editClient) {
		this.editClient = editClient;
	}

	public int getEditDepartment() {
		return this.editDepartment;
	}

	public void setEditDepartment(int editDepartment) {
		this.editDepartment = editDepartment;
	}

	public int getEditEmployee() {
		return this.editEmployee;
	}

	public void setEditEmployee(int editEmployee) {
		this.editEmployee = editEmployee;
	}

	public int getEditOtherEmployee() {
		return this.editOtherEmployee;
	}

	public void setEditOtherEmployee(int editOtherEmployee) {
		this.editOtherEmployee = editOtherEmployee;
	}

	public int getEditProject() {
		return this.editProject;
	}

	public void setEditProject(int editProject) {
		this.editProject = editProject;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
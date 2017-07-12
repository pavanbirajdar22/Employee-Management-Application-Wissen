package model;

import java.io.Serializable;
import javax.persistence.*;
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
	@Column(name="email_id")
	private String emailId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_login")
	private Date lastLogin;

	private String password;

	//bi-directional many-to-one association to Employee
	@ManyToOne
	@JoinColumn(name="eid")
	private Employee employee;

	//bi-directional many-to-one association to Group
	@ManyToOne
	@JoinColumn(name="gid")
	private Group group;

	//bi-directional one-to-one association to Visibilty
	@OneToOne(mappedBy="user")
	private Visibilty visibilty;

	public User() {
	}

	public String getEmailId() {
		return this.emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
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

	public Visibilty getVisibilty() {
		return this.visibilty;
	}

	public void setVisibilty(Visibilty visibilty) {
		this.visibilty = visibilty;
	}

}
package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Visibilty database table.
 * 
 */
@Entity
@NamedQuery(name="Visibilty.findAll", query="SELECT v FROM Visibilty v")
public class Visibilty implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="email_id")
	private String emailId;

	private int address;

	private String dob;

	private String gender;

	//bi-directional one-to-one association to User
	@OneToOne
	@JoinColumn(name="email_id")
	private User user;

	public Visibilty() {
	}

	public String getEmailId() {
		return this.emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public int getAddress() {
		return this.address;
	}

	public void setAddress(int address) {
		this.address = address;
	}

	public String getDob() {
		return this.dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
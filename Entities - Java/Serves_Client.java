package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the Serves_Client database table.
 * 
 */
@Entity
@NamedQuery(name="Serves_Client.findAll", query="SELECT s FROM Serves_Client s")
public class Serves_Client implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private Serves_ClientPK id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="end_date")
	private Date endDate;

	private String reason;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="start_date")
	private Date startDate;

	//bi-directional many-to-one association to Client
	@ManyToOne
	@JoinColumn(name="cid")
	private Client client;

	//bi-directional many-to-one association to Employee
	@ManyToOne
	@JoinColumn(name="eid")
	private Employee employee;

	public Serves_Client() {
	}

	public Serves_ClientPK getId() {
		return this.id;
	}

	public void setId(Serves_ClientPK id) {
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
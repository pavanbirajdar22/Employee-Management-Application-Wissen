package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the Works_On_Project database table.
 * 
 */
@Entity
@NamedQuery(name="Works_On_Project.findAll", query="SELECT w FROM Works_On_Project w")
public class Works_On_Project implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private Works_On_ProjectPK id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="end_date")
	private Date endDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="start_date")
	private Date startDate;

	//bi-directional many-to-one association to Employee
	@ManyToOne
	@JoinColumn(name="eid")
	private Employee employee;

	//bi-directional many-to-one association to Project
	@ManyToOne
	@JoinColumn(name="pid")
	private Project project;

	public Works_On_Project() {
	}

	public Works_On_ProjectPK getId() {
		return this.id;
	}

	public void setId(Works_On_ProjectPK id) {
		this.id = id;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

}
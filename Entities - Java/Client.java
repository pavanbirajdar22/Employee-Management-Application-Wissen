package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Client database table.
 * 
 */
@Entity
@NamedQuery(name="Client.findAll", query="SELECT c FROM Client c")
public class Client implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int cid;

	private String location;

	private String name;

	//bi-directional many-to-one association to Project
	@OneToMany(mappedBy="client")
	private List<Project> projects;

	//bi-directional many-to-one association to Serves_Client
	@OneToMany(mappedBy="client")
	private List<Serves_Client> servesClients;

	public Client() {
	}

	public int getCid() {
		return this.cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Project> getProjects() {
		return this.projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public Project addProject(Project project) {
		getProjects().add(project);
		project.setClient(this);

		return project;
	}

	public Project removeProject(Project project) {
		getProjects().remove(project);
		project.setClient(null);

		return project;
	}

	public List<Serves_Client> getServesClients() {
		return this.servesClients;
	}

	public void setServesClients(List<Serves_Client> servesClients) {
		this.servesClients = servesClients;
	}

	public Serves_Client addServesClient(Serves_Client servesClient) {
		getServesClients().add(servesClient);
		servesClient.setClient(this);

		return servesClient;
	}

	public Serves_Client removeServesClient(Serves_Client servesClient) {
		getServesClients().remove(servesClient);
		servesClient.setClient(null);

		return servesClient;
	}

}
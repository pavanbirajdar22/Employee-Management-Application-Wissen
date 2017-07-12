package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the Group_Permissions database table.
 * 
 */
@Entity
@Table(name="Group_Permissions")
@NamedQuery(name="Group_Permission.findAll", query="SELECT g FROM Group_Permission g")
public class Group_Permission implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private Group_PermissionPK id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date addedOnDate;

	//bi-directional many-to-one association to Group
	@ManyToOne
	@JoinColumn(name="gid")
	private Group group;

	//bi-directional many-to-one association to Permission
	@ManyToOne
	@JoinColumn(name="permission_id")
	private Permission permission;

	public Group_Permission() {
	}

	public Group_PermissionPK getId() {
		return this.id;
	}

	public void setId(Group_PermissionPK id) {
		this.id = id;
	}

	public Date getAddedOnDate() {
		return this.addedOnDate;
	}

	public void setAddedOnDate(Date addedOnDate) {
		this.addedOnDate = addedOnDate;
	}

	public Group getGroup() {
		return this.group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public Permission getPermission() {
		return this.permission;
	}

	public void setPermission(Permission permission) {
		this.permission = permission;
	}

}
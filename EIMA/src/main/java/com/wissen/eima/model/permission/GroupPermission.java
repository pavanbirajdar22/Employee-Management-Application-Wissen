package com.wissen.eima.model.permission;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;

/**
 * The persistent class for the Group_Permission database table.
 * 
 */
@Entity
@Table(name = "Group_Permission")
public class GroupPermission implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private GroupPermissionPK id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date addedOnDate;

	// bi-directional many-to-one association to Group
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "gid", insertable = false, updatable = false)
	private Group group;

	// bi-directional many-to-one association to Permission
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "permission_id", insertable = false, updatable = false)
	private Permission permission;

	public GroupPermission() {
	}

	public GroupPermissionPK getId() {
		return this.id;
	}

	public void setId(GroupPermissionPK id) {
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
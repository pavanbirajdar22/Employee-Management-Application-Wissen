package com.wissen.eima.model.permission;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Permission database table.
 * 
 */
@Entity
@NamedQuery(name="Permission.findAll", query="SELECT p FROM Permission p")
public class Permission implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="permission_id")
	private int permissionId;

	private String type;

	//bi-directional many-to-many association to Group
	@ManyToMany(mappedBy="permissions")
	private List<Group> groups;

	//bi-directional many-to-one association to Group_Permission
	@OneToMany(mappedBy="permission")
	private List<GroupPermission> groupPermissions;

	public Permission() {
	}

	public int getPermissionId() {
		return this.permissionId;
	}

	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Group> getGroups() {
		return this.groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

	public List<GroupPermission> getGroupPermissions() {
		return this.groupPermissions;
	}

	public void setGroupPermissions(List<GroupPermission> groupPermissions) {
		this.groupPermissions = groupPermissions;
	}

	public GroupPermission addGroupPermission(GroupPermission groupPermission) {
		getGroupPermissions().add(groupPermission);
		groupPermission.setPermission(this);

		return groupPermission;
	}

	public GroupPermission removeGroupPermission(GroupPermission groupPermission) {
		getGroupPermissions().remove(groupPermission);
		groupPermission.setPermission(null);

		return groupPermission;
	}

}
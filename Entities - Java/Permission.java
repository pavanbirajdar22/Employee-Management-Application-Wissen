package model;

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

	//bi-directional many-to-one association to Group_Permission
	@OneToMany(mappedBy="permission")
	private List<Group_Permission> groupPermissions;

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

	public List<Group_Permission> getGroupPermissions() {
		return this.groupPermissions;
	}

	public void setGroupPermissions(List<Group_Permission> groupPermissions) {
		this.groupPermissions = groupPermissions;
	}

	public Group_Permission addGroupPermission(Group_Permission groupPermission) {
		getGroupPermissions().add(groupPermission);
		groupPermission.setPermission(this);

		return groupPermission;
	}

	public Group_Permission removeGroupPermission(Group_Permission groupPermission) {
		getGroupPermissions().remove(groupPermission);
		groupPermission.setPermission(null);

		return groupPermission;
	}

}
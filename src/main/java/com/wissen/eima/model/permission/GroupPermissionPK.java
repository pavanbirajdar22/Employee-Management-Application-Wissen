package com.wissen.eima.model.permission;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the Group_Permission database table.
 * 
 */
@Embeddable
public class GroupPermissionPK implements Serializable {
	// default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column()
	private int gid;

	@Column(name = "permission_id", insertable = false, updatable = false)
	private int permissionId;

	public GroupPermissionPK() {
	}

	public int getGid() {
		return this.gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public int getPermissionId() {
		return this.permissionId;
	}

	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof GroupPermissionPK)) {
			return false;
		}
		GroupPermissionPK castOther = (GroupPermissionPK) other;
		return (this.gid == castOther.gid) && (this.permissionId == castOther.permissionId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.gid;
		hash = hash * prime + this.permissionId;

		return hash;
	}
}
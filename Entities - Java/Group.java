package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Group database table.
 * 
 */
@Entity
@NamedQuery(name="Group.findAll", query="SELECT g FROM Group g")
public class Group implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int gid;

	private String gname;

	//bi-directional many-to-one association to Group_Permission
	@OneToMany(mappedBy="group")
	private List<Group_Permission> groupPermissions;

	//bi-directional many-to-one association to User
	@OneToMany(mappedBy="group")
	private List<User> users;

	public Group() {
	}

	public int getGid() {
		return this.gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getGname() {
		return this.gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public List<Group_Permission> getGroupPermissions() {
		return this.groupPermissions;
	}

	public void setGroupPermissions(List<Group_Permission> groupPermissions) {
		this.groupPermissions = groupPermissions;
	}

	public Group_Permission addGroupPermission(Group_Permission groupPermission) {
		getGroupPermissions().add(groupPermission);
		groupPermission.setGroup(this);

		return groupPermission;
	}

	public Group_Permission removeGroupPermission(Group_Permission groupPermission) {
		getGroupPermissions().remove(groupPermission);
		groupPermission.setGroup(null);

		return groupPermission;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User addUser(User user) {
		getUsers().add(user);
		user.setGroup(this);

		return user;
	}

	public User removeUser(User user) {
		getUsers().remove(user);
		user.setGroup(null);

		return user;
	}

}
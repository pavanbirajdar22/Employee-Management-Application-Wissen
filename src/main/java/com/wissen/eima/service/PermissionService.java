package com.wissen.eima.service;

import java.util.List;

import com.wissen.eima.model.permission.Permission;

public interface PermissionService {

	boolean changePermissionsForUser(final Permission permission);

	boolean changePermissionForUsers(final List<Permission> permissions);

}

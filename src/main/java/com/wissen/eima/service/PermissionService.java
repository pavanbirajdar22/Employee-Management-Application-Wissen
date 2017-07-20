package com.wissen.eima.service;

public interface PermissionService {

	boolean grantPermissionToUser(final int userId, final String permissionType);

	boolean revokePermissionToUser(final int userId, final String permissionType);

	boolean grantPermissionToUsers(final int[] userIds, final String permissionType);

	boolean revokePermissionToUsers(final int[] userIds, final String permissionType);

}

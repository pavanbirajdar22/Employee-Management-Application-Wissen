package com.wissen.eima.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wissen.eima.model.permission.Permission;
import com.wissen.eima.repository.PermissionRepository;
import com.wissen.eima.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	PermissionRepository permissionRepository;

	@Override
	public boolean changePermissionsForUser(Permission permissionRequest) {
		int eid = permissionRequest.getEid();
		Permission permission = permissionRepository.findByEid(eid);
		permission.setAddClient(permissionRequest.getAddClient());
		permission.setAddDepartment(permissionRequest.getAddDepartment());
		permission.setEditDepartment(permissionRequest.getEditDepartment());
		permission.setEditClient(permissionRequest.getEditClient());
		permission.setAddEmployee(permissionRequest.getAddEmployee());
		permission.setEditOtherEmployee(permissionRequest.getEditOtherEmployee());
		permission.setDeleteUser(permissionRequest.getDeleteUser());
		permission.setEditEmployee(permissionRequest.getEditEmployee());
		permission.setAddProject(permissionRequest.getAddProject());
		permission.setEditProject(permissionRequest.getEditProject());
		permission.setGenerateReport(permissionRequest.getGenerateReport());
		permissionRepository.saveAndFlush(permission);
		return true;
	}

	@Override
	public boolean changePermissionForUsers(List<Permission> permissionRequests) {
		for (Permission permissionRequest : permissionRequests) {
			changePermissionsForUser(permissionRequest);
		}
		return true;
	}

}
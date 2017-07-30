package com.wissen.eima.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wissen.eima.model.permission.Permission;
import com.wissen.eima.service.impl.PermissionServiceImpl;

@RestController
@RequestMapping(value = "/permission")
@CrossOrigin(origins = "*")
public class PermissionController {

	@Autowired
	PermissionServiceImpl permissionServiceImpl;

	@RequestMapping(value = "/editPermission", method = RequestMethod.POST)
	public boolean editPermission(@RequestBody Permission permissionRequest) {
		return permissionServiceImpl.changePermissionsForUser(permissionRequest);
	}
	
}
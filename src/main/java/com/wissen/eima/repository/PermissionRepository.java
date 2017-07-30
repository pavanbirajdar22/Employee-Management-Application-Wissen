package com.wissen.eima.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.wissen.eima.model.permission.Permission;

@CrossOrigin(origins = "*")
public interface PermissionRepository extends JpaRepository<Permission, Integer> {
	Permission findByEid(int eid);
}

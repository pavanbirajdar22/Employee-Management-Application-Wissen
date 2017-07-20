package com.wissen.eima.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wissen.eima.model.permission.Permission;

public interface PermissionRepository extends JpaRepository<Permission, Integer> {
	Permission findByEid(int eid);
}

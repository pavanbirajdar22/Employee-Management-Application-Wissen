package com.wissen.eima.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wissen.eima.model.employee.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
}

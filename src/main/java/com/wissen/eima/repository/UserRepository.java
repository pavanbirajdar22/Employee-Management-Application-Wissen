package com.wissen.eima.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.wissen.eima.model.employee.User;

@CrossOrigin(origins = "*")
public interface UserRepository extends JpaRepository<User, Integer> {
	User findUserByEid(int eid);
	
	User findUserByEmailId(String email);
	
	
}

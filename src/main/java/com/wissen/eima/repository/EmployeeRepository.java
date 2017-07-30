package com.wissen.eima.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.wissen.eima.model.employee.Employee;

@CrossOrigin(origins = "*")
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	Employee findByFirstNameContains(@Param("firstName") final String firstName);

	Employee findByLastNameContains(@Param("lastName") final String lastName);

	Employee findByEid(@Param("eid") int eid);
	
	@Transactional
	@Modifying
	@Query(value = "insert into employee_project(eid,pid) values(?1,?2)", nativeQuery = true)
	int insertIntoEmployeeProject(int eid,int pid);
	
	@Transactional
	@Modifying
	@Query(value = "insert into employee_client(eid,cid) values(?1,?2)", nativeQuery = true)
	int insertIntoEmployeeClient(int eid,int cid);
	
	
	@Transactional
	@Modifying
	@Query(value = "insert into address(type,line1,line2,city,state,country,pincode,eid) values(?1,?2,?3,?4,?5,?6,?7,?8)", nativeQuery = true)
	int insertIntoAddress(int type,String line1,String line2,String city,String state,String country,int pincode,int eid);
	
	@Transactional
	@Modifying
	@Query(value = "insert into user(eid,email_id,password) values(?1,?2,?3)", nativeQuery = true)
	int insertIntoUser(int eid,String emailId,String password);

	List<Employee> findByJoiningDateBetween(final Date startDate, final Date endDate);

	List<Employee> findByLeavingDateBetween(final Date startDate, final Date endDate);

}

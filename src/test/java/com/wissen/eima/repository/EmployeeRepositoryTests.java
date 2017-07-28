package com.wissen.eima.repository;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.wissen.eima.model.employee.Employee;

@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
public class EmployeeRepositoryTests {

	@Autowired
	private EmployeeRepository employeeRepository;

	SimpleDateFormat sdf;

	@Test
	public void testGetEmployeesHired() throws ParseException {
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Employee> result = employeeRepository.findByJoiningDateBetween(sdf.parse("2008-03-02"),
				sdf.parse("2017-02-01"));
		assertEquals(2, result.size());
	}

	@Test
	public void testGetEmployeesLeft() throws ParseException {
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Employee> result = employeeRepository.findByLeavingDateBetween(sdf.parse("2008-03-02"),
				sdf.parse("2017-02-01"));
		assertEquals(0, result.size());

	}
}

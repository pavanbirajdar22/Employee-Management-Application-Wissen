package com.wissen.eima;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.model.employee.Gender;

@SpringBootApplication
public class EimaApplication {

	public static void main(String[] args) {
		SpringApplication.run(EimaApplication.class, args);
//		Employee e = new Employee();
//		e.setGender(0);
//		System.out.println(e.getGender());
	}
}

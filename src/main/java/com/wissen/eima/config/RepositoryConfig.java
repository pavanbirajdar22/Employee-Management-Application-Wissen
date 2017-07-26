package com.wissen.eima.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurerAdapter;

import com.wissen.eima.model.client.Client;
import com.wissen.eima.model.department.Department;
import com.wissen.eima.model.employee.Employee;
import com.wissen.eima.model.employee.User;
import com.wissen.eima.model.project.Project;

@Configuration
public class RepositoryConfig extends RepositoryRestConfigurerAdapter {

	@Override
	public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
		config.exposeIdsFor(Employee.class);
		config.exposeIdsFor(Project.class);
		config.exposeIdsFor(Client.class);
		config.exposeIdsFor(Department.class);
		config.exposeIdsFor(User.class);
	}
}

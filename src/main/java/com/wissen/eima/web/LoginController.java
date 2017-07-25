package com.wissen.eima.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wissen.eima.model.employee.User;
import com.wissen.eima.repository.UserRepository;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins="*")

public class LoginController {

	@Autowired
	UserRepository userRepository;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Response doLogin(@RequestBody User u) {
		Response response = null;
		try {
			response=new Response();
			User user = userRepository.findUserByEmailId(u.getEmailId());
			
			if (user == null) {
				response.setUser(null);
				response.setMessage("Email Id doesn't exist!!");
			}
			if (!user.getPassword().equals(u.getPassword())) {
				response.setUser(null);
				response.setMessage("Email Id and Password do not match!!");
				
			} else {
				response.setUser(user);
				response.setMessage("Match");
			
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return response;
	}
}

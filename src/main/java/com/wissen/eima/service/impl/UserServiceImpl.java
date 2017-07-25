package com.wissen.eima.service.impl;

import org.springframework.stereotype.Service;

import com.wissen.eima.service.UserService;
import com.wissen.eima.service.VisibilityRequest;

@Service
public class UserServiceImpl implements UserService {

	@Override
	public boolean changeVisibilityForUser(VisibilityRequest visibilityRequest) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean userExists(String emailId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean userPasswordMathes(String emailId, String hash) {
		// TODO Auto-generated method stub
		return false;
	}

}

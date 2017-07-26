package com.wissen.eima.service;

public interface UserService {
	boolean changeVisibilityForUser(VisibilityRequest visibilityRequest);

	boolean userExists(String emailId);

	boolean userPasswordMathes(String emailId, String hash);
}

package service;

import repository.UserRepository;

public class UserService {
	
	private UserRepository userRepository = new UserRepository();

	public boolean signUpUser(String username, String fullname, String password, String email, String phone) {
		
		int count = userRepository.signUpUser(username, fullname, password, email, phone);
		
		return count > 0;
		
	}

}


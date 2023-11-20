package service;

import repository.UserRepository;

public class UserService {
	
	private UserRepository userRepository = new UserRepository();


	public boolean isUsernameExists(String username) {
		
		return userRepository.isUsernameExists(username);
	}


	public boolean isEmailExists(String email) {
		return userRepository.isEmailExists(email);
	}

	public boolean isPhoneExists(String phone) {
		return userRepository.isPhoneExists(phone);
	}

	public boolean signUpUser(String username, String fullname, String password, String email, String phone) {
		if (isUsernameExists(username)) {
			return false;
		}

		if (isEmailExists(email)) {
			return false;
		}

		if (isPhoneExists(phone)) {
			return false;
		}

		int count = userRepository.signUpUser(username, fullname, password, email, phone);

		return count > 0;
	}

}

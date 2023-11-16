package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import config.SQLServerConfig;

public class UserRepository {
	
	public int signUpUser(String username, String password, String fullname, String email, String phone) {
		
		int count = 0;


		String query = "EXEC InsertUserAndBookingUser ?, ?, ?, ?, ?";

		
		Connection connection = SQLServerConfig.getConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, username);
			statement.setString(2, password);
			statement.setString(3, fullname);
			statement.setString(4, email);
			statement.setString(5, phone);

			
			count = statement.executeUpdate();
			
		} catch (SQLException e) {
			
			System.out.println("Error signup: " + e.getLocalizedMessage());
		
		} finally {
			
			try {
				connection.close();
				
			} catch (Exception e) {
				System.out.println("Error close connection " + e.getLocalizedMessage());
			}
		}
		return count;
	}

}

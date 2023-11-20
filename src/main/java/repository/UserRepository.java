package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.SQLServerConfig;

public class UserRepository {


    public boolean isUsernameExists(String username) {
        try {
            Connection connection = SQLServerConfig.getConnection();
            String query = "SELECT COUNT(*) FROM [User] WHERE userName = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, username);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        int count = resultSet.getInt(1);
                        return count > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); 

        }
        return false;
    }


    public boolean isEmailExists(String email) {
    	
        try {
            Connection connection = SQLServerConfig.getConnection();
            String query = "SELECT COUNT(*) FROM [User] WHERE email = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, email);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        int count = resultSet.getInt(1);
                        return count > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); 

        }
        return false;
    }

    public boolean isPhoneExists(String phone) {
        try {
            Connection connection = SQLServerConfig.getConnection();
            String query = "SELECT COUNT(*) FROM BookingUser WHERE phoneNumber = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, phone);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        int count = resultSet.getInt(1);
                        return count > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); 

        }
        return false;
    }

    public int signUpUser(String username, String password, String fullname, String email, String phone) {

        if (isUsernameExists(username) || isEmailExists(email) || isPhoneExists(phone)) {

            return 0;
        }

        int count = 0;

        String query = "EXEC InsertUserAndBookingUser ?, ?, ?, ?, ?";

        try (Connection connection = SQLServerConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, fullname);
            statement.setString(4, email);
            statement.setString(5, phone);

            count = statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error signup: " + e.getLocalizedMessage());
        }

        return count;
    }
    
}

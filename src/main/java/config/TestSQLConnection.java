package config;

import java.sql.Connection;
import java.sql.SQLException;

public class TestSQLConnection {
	public static void main(String[] args) {
        Connection connection = SQLServerConfig.getConnection();

        if (connection != null) {
            System.out.println("Connection successful!");


            try {

                connection.close();
                System.out.println("Connection closed.");
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        } else {
            System.out.println("Connection failed!");
        }
    }
}

package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServerConfig {
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			
			 return DriverManager.getConnection("jdbc:sqlserver://localhost:1434;databaseName=Final_Project;trustServerCertificate=true", "sa", "admin@123");
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Lỗi kết nối " + e.getLocalizedMessage());
			
			return null;
		}  
		
	}
	
}

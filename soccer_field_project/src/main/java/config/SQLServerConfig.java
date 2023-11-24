package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class SQLServerConfig {

	public static Connection getConnection() {

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			 return DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Fsoft_final;trustServerCertificate=true", "sa", "123456");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Lỗi kết nối " + e.getLocalizedMessage());

			return null;
		}

	}

}

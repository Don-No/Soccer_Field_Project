package controller;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {

	public static Connection makeConnection() throws ClassNotFoundException {
        try {
            String url = "jdbc:sqlserver://localhost:1433;encrypt=true;databaseName=Final_Project;trustServerCertificate=true";
            String username = "sa";
            String password = "sa";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, username, password);
            return con;
        } catch (SQLException e) {
            e.getMessage();
            return null;
        }
    }
	
//	public static void main(String[] args) {
//		Connection conn = null;
//		try {
//			conn = DBconnection.makeConnection();
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}
//		
//		System.out.println(conn);
//	}
}

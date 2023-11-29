package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import config.DBconnection;
import model.Account;
import model.Pitch;
import model.Product;
import model.User;

public class UserDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;


    public List<Account> getListAcc() throws SQLException, ClassNotFoundException{
        String query = "Select userName , passWord , email, roleID, fullName From [User]";
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs= ps.executeQuery();
        List<Account> list = new ArrayList<>()  ;
        while(rs.next()){
            list.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
        }
        return list;
    }

    
    
    // get user by id
    public User getUserById(String userId) throws SQLException, ClassNotFoundException {
        conn = DBconnection.makeConnection();
        String query = "SELECT userID, userName, roleID, email, fullName, address, phoneNumber  FROM [User] WHERE userID = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, userId);
        rs = ps.executeQuery();
        if (rs.next()) {
            User user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                    rs.getString(5), rs.getString(6), rs.getString(7));
            return user;
        }
        return null; 
    }
    
    //update user 
    public void updateUser(String user_id, String role) throws SQLException, ClassNotFoundException {

        conn = DBconnection.makeConnection();
        String query = "Update [User] set roleID  =? where userID =?";
        ps = conn.prepareStatement(query);
        ps.setString(1, role);
        ps.setString(2, user_id);
        ps.executeUpdate();

    }
    
    public List<User> getPaginatedUserList(int offset, int limit) throws SQLException, ClassNotFoundException{
        String query = "Select userID, userName, roleID, email, fullName, address, phoneNumber From [User] ORDER BY userID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<User> list = new ArrayList<>();
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, limit);
        ps.setInt(2, offset);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
        }
        return list;
    }
    
    public List<User> getListUser() throws SQLException, ClassNotFoundException{
        String query = "Select userID, userName, roleID, email, fullName, address, phoneNumber From [User]";
        List<User> list = new ArrayList<>();
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
        }
        return list;
    }

    
    // delete user 
    public void deleteUser(int userId) throws SQLException, ClassNotFoundException {
        conn = DBconnection.makeConnection();
        String query = "DELETE FROM [User] WHERE userID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        ps.executeUpdate();
    }
}



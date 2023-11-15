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
        String query = "Select userName , passWord , email, roleID From User_Table";
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs= ps.executeQuery();
        List<Account> list = new ArrayList<>()  ;
        while(rs.next()){
            list.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            System.out.println(rs.getString(1) + " " +rs.getString(2));
        }
        return list;
    }

    
    public User getProfile(String username) throws SQLException, ClassNotFoundException{
        String query = "Select username, role, email, fullname, address, phone , img From User_Table ";
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
        }
        return null;
    }
    
    public List<User> getListUser() throws SQLException, ClassNotFoundException{
        String query = "Select userID, userName, roleID, email, fullName, address, phoneNumber , img From User_Table ";
        List<User> list = new ArrayList<>();
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
        }
        return list;
    }
    
    public List<Product> getListProduct() throws SQLException, ClassNotFoundException{
        String query = "Select productID, productName, img, productPrice, quantity From Product ";
        List<Product> list = new ArrayList<>();
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
        }
        return list;
    }
    
    public List<Pitch> getListPitch() throws SQLException, ClassNotFoundException{
        String query = "Select pitchID, img, price, pitchTypeID From Pitch ";
        List<Pitch> list = new ArrayList<>();
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new Pitch(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
        }
        return list;
    }
    
    public void addProduct(String productName, String img, String productPrice,
            String quantity) throws SQLException, ClassNotFoundException {

            conn = DBconnection.makeConnection();
            String query ="Insert into Product Values(?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, productName);
            ps.setString(2, img);
            ps.setString(3, productPrice);
            ps.setString(4, quantity);
            ps.executeUpdate();
    }
    
 // delete product
    public void deleteProduct(int proId) throws SQLException, ClassNotFoundException {
        conn = DBconnection.makeConnection();
        String query = "DELETE FROM Product WHERE productID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, proId);
        ps.executeUpdate();
    }
    
 // delete pitch
    public void deletePitch(int pitchId) throws SQLException, ClassNotFoundException {
        conn = DBconnection.makeConnection();
        String query = "DELETE FROM Pitch WHERE pitchID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, pitchId);
        ps.executeUpdate();
    }
    
    // delete user 
    public void deleteUser(int userId) throws SQLException, ClassNotFoundException {
        conn = DBconnection.makeConnection();
        String query = "DELETE FROM User_Table WHERE userID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        ps.executeUpdate();
    }
}



package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import config.SQLServerConfig;
import model.Account;
import model.Pitch;
import model.Product;
import model.User;

public class UserDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;


    public List<Account> getListAcc() throws SQLException, ClassNotFoundException{
        String query = "Select userName , passWord , email, roleID From [User]";
        conn = SQLServerConfig.getConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        List<Account> list = new ArrayList<>()  ;
        while(rs.next()){
            list.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
        }
        return list;
    }

    
    public User getProfile(String username) throws SQLException, ClassNotFoundException {
        String query = "Select userName , roleID, email, fullName, address, phoneNumber From [User]";
        conn = SQLServerConfig.getConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
        }
        return null;
    }
    
    public List<User> getListUser() throws SQLException, ClassNotFoundException{
        String query = "Select userName, roleID ,email, fullName, address, phoneNumber From [User]";
        List<User> list = new ArrayList<>();
        conn = SQLServerConfig.getConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
        }
        System.out.println(list.size());
        return list;
    }
    
    public List<Product> getListProduct() throws SQLException, ClassNotFoundException{
        String query = "Select productName, img, productPrice, quantity From Product ";
        List<Product> list = new ArrayList<>();
        conn = SQLServerConfig.getConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            System.out.println(rs.getString(2));
        }
        System.out.println(list.size());
        return list;
    }
    
    public List<Pitch> getListPitch() throws SQLException, ClassNotFoundException {
        String query = "SELECT pitchID, img, price, pitchTypeID FROM Pitch";
        List<Pitch> list = new ArrayList<>();

        try (Connection conn = SQLServerConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Pitch pitch = new Pitch(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(pitch);
            }
        }

        return list;
    }

    
    public void addPitch(String img, String pitchPrice, String pitchType) throws SQLException, ClassNotFoundException {
        try {
            conn = SQLServerConfig.getConnection();
            String query = "INSERT INTO Pitch VALUES (?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, img);
            ps.setString(2, pitchPrice);
            ps.setString(3, pitchType);
            ps.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
            throw e;
        } finally {

            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    
    
    public void addProduct(String productName, String img, String productPrice,
            String quantity) throws SQLException, ClassNotFoundException {

            conn = SQLServerConfig.getConnection();
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
        conn = SQLServerConfig.getConnection();
        String query = "DELETE FROM Product WHERE productID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, proId);
        ps.executeUpdate();
    }
    
 // delete pitch
    public void deletePitch(int pitchId) throws SQLException, ClassNotFoundException {
        conn = SQLServerConfig.getConnection();
        String query = "DELETE FROM Pitch WHERE pitchID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, pitchId);
        ps.executeUpdate();
    }
    
    // delete user 
    public void deleteUser(int userId) throws SQLException, ClassNotFoundException {
        conn = SQLServerConfig.getConnection();
        String query = "DELETE FROM [User] WHERE userID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        ps.executeUpdate();
    }
    
    
    
}



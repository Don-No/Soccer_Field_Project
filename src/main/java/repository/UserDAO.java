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
}



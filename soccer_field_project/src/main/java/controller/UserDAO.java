package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Account;
import model.User;

public class UserDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;


    public List<Account> getListAcc() throws SQLException, ClassNotFoundException{
        String query = "Select username , password , email From User_Table";
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs= ps.executeQuery();
        List<Account> list = new ArrayList<>()  ;
        while(rs.next()){
            list.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3)));
        }
        return list;
    }

}



package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import config.DBconnection;
import model.Order;


public class OrderDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    
    public List<Order> getListOrder() throws SQLException, ClassNotFoundException {
        String query = "Select [User].fullName, OrderDetail.totalPrice, OrderDetail.currentTime, OrderDetail.paymethod, OrderDetail.status "
                + "From OrderDetail "
                + "JOIN [User] on OrderDetail.userID = [User].userID";
        List<Order> list = new ArrayList<>();

        try {
            conn = DBconnection.makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");

            while (rs.next()) {
                String currentTimeString = rs.getString(3);
                Date currentTime = inputFormat.parse(currentTimeString);
                String formattedDate = outputFormat.format(currentTime);

                list.add(new Order(rs.getString(1), rs.getString(2), formattedDate, rs.getString(4), rs.getString(5)));
            }
        } catch (ParseException e) {
            e.printStackTrace(); 
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return list;
    }
    
}



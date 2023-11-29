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

public class PitchDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    
    public List<Pitch> getListPitch() throws SQLException, ClassNotFoundException{
        String query = "SELECT pitchID, img, price, pitchTypeID, name\r\n"
        		+ "FROM Pitch\r\n"
        		+ "WHERE price > 0;\r\n"
        		+ "";
        List<Pitch> list = new ArrayList<>();
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new Pitch(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
        }
        return list;
    }
    
    public void addPitch(String img, String pitchPrice,
            String pitchType, String name, String detail) throws SQLException, ClassNotFoundException {

            conn = DBconnection.makeConnection();
            String query ="Insert into Pitch Values(?,?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, img);
            ps.setString(2, pitchPrice);
            ps.setString(3, pitchType);
            ps.setString(4, name);
            ps.setString(5, detail);
            ps.executeUpdate();
    }
    
    
 // delete pitch
//    public void deletePitch(int pitchId) throws SQLException, ClassNotFoundException {
//        conn = DBconnection.makeConnection();
//        String query = "DELETE FROM Pitch WHERE pitchID = ?";
//        ps = conn.prepareStatement(query);
//        ps.setInt(1, pitchId);
//        ps.executeUpdate();
//    }
    
    public void deletePitch(int pitch_id) throws SQLException, ClassNotFoundException {
        conn = DBconnection.makeConnection();
        String query = "Update Pitch set price = 0 where pitchID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, pitch_id);
        ps.executeUpdate();
    }
    
    // get pitch by id
    public Pitch getPitchById(String pitchId) throws SQLException, ClassNotFoundException {
        conn = DBconnection.makeConnection();
        String query = "SELECT img, price, pitchTypeID, name, detail FROM Pitch WHERE pitchID = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, pitchId);
        rs = ps.executeQuery();
        if (rs.next()) {
            Pitch pitch = new Pitch(pitchId, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            return pitch;
        }
        return null; 
    }
    
    //update pitch 
    public void updatePitch(String pitchID, String img, String price, String pitchTypeID, String name, String detail) throws SQLException, ClassNotFoundException {

        conn = DBconnection.makeConnection();
        String query = "Update Pitch set img  =?, price  =?, pitchTypeID  =?, name  =?, detail  =? where pitchID =?";
        ps = conn.prepareStatement(query);
        ps.setString(1, img);
        ps.setString(2, price);
        ps.setString(3, pitchTypeID);
        ps.setString(4, name);
        ps.setString(5, detail);
        ps.setString(6, pitchID);
        ps.executeUpdate();

    }
   

}



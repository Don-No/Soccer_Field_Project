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

public class ProductDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

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
//    public void deleteProduct(int proId) throws SQLException, ClassNotFoundException {
//        conn = DBconnection.makeConnection();
//        String query = "DELETE FROM Product WHERE productID = ?";
//        ps = conn.prepareStatement(query);
//        ps.setInt(1, proId);
//        ps.executeUpdate();
//    }
    
    public void deleteProduct(int product_id) throws SQLException, ClassNotFoundException {
        conn = DBconnection.makeConnection();
        String query = "Update Product set quantity = 0 where productID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, product_id);
        ps.executeUpdate();
    }
    
    public List<Product> getListProduct() throws SQLException, ClassNotFoundException{
        String query = "SELECT productID, productName, img, productPrice, quantity\r\n"
        		+ "FROM Product\r\n"
        		+ "WHERE quantity > 0;\r\n"
        		+ "";
        List<Product> list = new ArrayList<>();
        conn = DBconnection.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
        }
        return list;
    }
    // get product by id
    public Product getProductById(String productId) throws SQLException, ClassNotFoundException {
        conn = DBconnection.makeConnection();
        int idPro = Integer.parseInt(productId);
        String query = "SELECT productName, img, productPrice, quantity FROM Product WHERE productID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, idPro);
        rs = ps.executeQuery();
        if (rs.next()) {
            Product product = new Product(productId, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            return product;
        }
        return null; 
    }
    
    //update product 
    public void updateProduct(String product_id, String productName, String img, String productPrice, String productQuantity) throws SQLException, ClassNotFoundException {

        conn = DBconnection.makeConnection();
        String query = "Update Product set productName  =?, img  =?, productPrice  =?, quantity  =? where productID =?";
        ps = conn.prepareStatement(query);
        ps.setString(1, productName);
        ps.setString(2, img);
        ps.setString(3, productPrice);
        ps.setString(4, productQuantity);
        ps.setString(5, product_id);
        ps.executeUpdate();

    }
   

}



package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repository.UserDAO;

@WebServlet("/addProduct")
public class AddProduct extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName  = req.getParameter("productName");
        String productPrice = req.getParameter("productPrice");
        String productQuantity = req.getParameter("productQuantity");
        String filename="";
        System.out.println(productName + " " + productPrice);
//        Part part = req.getPart("productImage");
//        System.out.println(part);
//        if(part.getSize() != 0){
//            filename = new Feature().getFileName(part);
//            part.write(filename);
//            filename = "images/" + filename;
//        }
        try {
            new UserDAO().addProduct(productName, filename, productPrice, productQuantity);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        resp.sendRedirect("admin_product");      
    }

}

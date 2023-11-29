package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repository.PitchDAO;
import repository.ProductDAO;
import repository.UserDAO;

@WebServlet("/addProduct")
public class AddProduct extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName  = req.getParameter("productName");
        String productPrice = req.getParameter("productPrice");
        String productQuantity = req.getParameter("productQuantity");
        String imgPre = req.getParameter("productImage");
        String img = "images/" + imgPre;

        try {
            new ProductDAO().addProduct(productName, img, productPrice, productQuantity);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        resp.sendRedirect("admin_product");      
    }

}

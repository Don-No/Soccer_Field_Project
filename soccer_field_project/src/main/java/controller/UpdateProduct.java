package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.ProductDAO;
import repository.UserDAO;

@WebServlet("/updateProduct")
public class UpdateProduct extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("product_id");
		String name = req.getParameter("productName");
		String img = req.getParameter("uploadImage");
		String imgPre = req.getParameter("img_pre");
		String price = req.getParameter("productPrice");
		String quantity = req.getParameter("quantity");
		
		String linkImg;

		if (!img.equals("")) {
		    linkImg = "images/" + img;
		} else {
		    linkImg = imgPre;
		}
		ProductDAO dao = new ProductDAO();
		try {
			dao.updateProduct(id, name, linkImg, price, quantity);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("admin_product");
	}

}

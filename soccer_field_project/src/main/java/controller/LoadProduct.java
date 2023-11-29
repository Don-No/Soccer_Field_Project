package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.User;
import repository.ProductDAO;
import repository.UserDAO;

@WebServlet("/loadProduct")
public class LoadProduct extends HttpServlet {
	protected void doGet(HttpServletRequest rq, HttpServletResponse rsp) throws ServletException, IOException {
		String id = rq.getParameter("product_id");
		ProductDAO dao = new ProductDAO();
		try {
			Product product = dao.getProductById(id);
			
			rq.setAttribute("detail", product);
			rq.getRequestDispatcher("updateProduct.jsp").forward(rq, rsp);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}

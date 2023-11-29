package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.UserRepository;

import java.io.IOException;
import java.sql.SQLException;

public class Store extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 UserRepository userService = new UserRepository();
		try {
			request.setAttribute("products", userService.getAllProducts());
			System.out.println(userService.getAllProducts());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;

import entity.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repository.UserRepository;



/**
 * Servlet implementation class LoginUser
 */

public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
	        
	}
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        request.getRequestDispatcher("/login.jsp").forward(request, response);
	    }

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {

			  String username = req.getParameter("username");
		        String password = req.getParameter("password");
		   
				UserRepository userService=new UserRepository();
				HttpSession session = req.getSession();

		        if (userService.getCustomerByUserName(username) != null) {
		            UserEntity user = new UserEntity(username, password);
		            UserEntity account = userService.Login(user);
		            System.out.println(account);
		            if (account == null) {
		                req.setAttribute("mess", "Wrong username or password.");
		                req.getRequestDispatcher("login.jsp").forward(req, resp);
		            } else {
		                session.setAttribute("acc", account);
		            	req.getRequestDispatcher("index.jsp").forward(req, resp);
		            }
		           
		            
		          }
	    }

}

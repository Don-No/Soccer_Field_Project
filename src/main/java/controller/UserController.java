package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

@WebServlet(name = "userController", urlPatterns = {"/signup"})
public class UserController extends HttpServlet{
	
	private UserService userService = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		
		switch (path) {
		
		case "/signup":
			
			req.getRequestDispatcher("signup.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String username = req.getParameter("username");
	    String fullname = req.getParameter("fullname");
	    String password = req.getParameter("password");
	    String email = req.getParameter("email");
	    String phone = req.getParameter("phone");
	    
	    if (username.isEmpty() || fullname.isEmpty() || password.isEmpty()
	            || email.isEmpty() || phone.isEmpty()) {
	        req.setAttribute("emptyFields", "Vui lòng điền đầy đủ thông tin");
	        req.getRequestDispatcher("signup.jsp").forward(req, resp);
	        return;
	    }
	    	
	    boolean isSuccess = userService.signUpUser(username, fullname, password, email, phone);

	    if (isSuccess) {
	        resp.sendRedirect("index.html");
	    } else {
	    	req.getRequestDispatcher("signup.jsp").forward(req, resp);
	    }
	}

	

}

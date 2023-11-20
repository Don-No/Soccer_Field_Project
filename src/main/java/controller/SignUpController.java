package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

@WebServlet(name = "userController", urlPatterns = {"/signup"})
public class SignUpController extends HttpServlet{
	
	private UserService userService = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		
		switch (path) {
			case "/login":
				req.getRequestDispatcher("login.jsp").forward(req, resp);
				break;
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
	        req.getRequestDispatcher("login.jsp").forward(req, resp);
	        return;
	    }

	    // Kiểm tra username, email, phone tồn tại trước khi đăng ký
	    if (userService.isUsernameExists(username)) {
	        req.setAttribute("signupError", "Username đã tồn tại");
	        req.getRequestDispatcher("login.jsp").forward(req, resp);
	        return;
	    }

	    if (userService.isEmailExists(email)) {
	        req.setAttribute("signupError", "Email đã tồn tại");
	        req.getRequestDispatcher("login.jsp").forward(req, resp);
	        return;
	    }

	    if (userService.isPhoneExists(phone)) {
	        req.setAttribute("signupError", "Số điện thoại đã tồn tại");
	        req.getRequestDispatcher("login.jsp").forward(req, resp);
	        return;
	    }

	    // Nếu không có lỗi, thực hiện đăng ký
	    boolean isSuccess = userService.signUpUser(username, fullname, password, email, phone);

	    if (isSuccess) {
	        resp.sendRedirect("login.jsp");
	    } else {
	    	req.getRequestDispatcher("login.jsp").forward(req, resp);
	    }
	}
}

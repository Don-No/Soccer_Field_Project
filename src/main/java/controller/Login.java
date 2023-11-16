package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import model.Account;
import model.User;
import repository.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/login"})
public class Login extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		
		switch (path) {
		
		case "/login":
			
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
	
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("rem");
        boolean check = false;
        try {
            List<Account> list_acc = new UserDAO().getListAcc();
          for (Account acc : list_acc) {
            if(acc.getUsername().equals(username)&acc.getPassword().equals(password)){
                if(remember!= null){
                    Cookie cookie = new Cookie("user", username);
                    cookie.setMaxAge(3000);
                    resp.addCookie(cookie);
                }
                HttpSession session = req.getSession();
                session.setAttribute("user", username);
                if (acc.getRole().equals("1")) {
                req.getRequestDispatcher("AdminPage").forward(req, resp);
                } else {
                	req.getRequestDispatcher("product.html").forward(req, resp);
                }
            }
          }
      		req.setAttribute("mess", "Wrong username or password!" );
      		req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        
    }
}


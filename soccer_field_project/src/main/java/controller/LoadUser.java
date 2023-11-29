package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import repository.UserDAO;

@WebServlet("/loadUser")
public class LoadUser extends HttpServlet {
	protected void doGet(HttpServletRequest rq, HttpServletResponse rsp) throws ServletException, IOException {
		String id = rq.getParameter("user_id");
		UserDAO dao = new UserDAO();
		try {
			User user = dao.getUserById(id);
			
			rq.setAttribute("detail", user);
			rq.getRequestDispatcher("updateUser.jsp").forward(rq, rsp);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}

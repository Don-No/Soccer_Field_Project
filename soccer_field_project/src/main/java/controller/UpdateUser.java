package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.UserDAO;

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String role_user = req.getParameter("roleUser");
		String id_user = req.getParameter("user_id");
		System.out.println("role user =" + role_user + "id=" + id_user);
		UserDAO dao = new UserDAO();
		try {
			dao.updateUser(id_user, role_user);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("AdminPage");
	}

}

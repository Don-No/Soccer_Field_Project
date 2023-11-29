package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pitch;
import model.User;
import repository.PitchDAO;
import repository.UserDAO;

@WebServlet("/loadPitch")
public class LoadPitch extends HttpServlet {
	protected void doGet(HttpServletRequest rq, HttpServletResponse rsp) throws ServletException, IOException {
		String id = rq.getParameter("pitch_id");
		PitchDAO dao = new PitchDAO();
		try {
			Pitch pitch = dao.getPitchById(id);
			
			rq.setAttribute("detail", pitch);
			rq.getRequestDispatcher("updatePitch.jsp").forward(rq, rsp);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}

package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.PitchDAO;
import repository.UserDAO;

/**
 * Servlet implementation class DeletePitch
 */
@WebServlet("/deletePitch")
public class DeletePitch extends HttpServlet {
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pitch_id = Integer.parseInt(req.getParameter("pitch_id"));
        try {
            new PitchDAO().deletePitch(pitch_id);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        resp.sendRedirect("listPitch");

    }

}

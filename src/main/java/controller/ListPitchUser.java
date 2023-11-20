package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pitch;
import repository.UserDAO;

@WebServlet(name = "listPitchUser", urlPatterns = "/listPitchUser")
public class ListPitchUser extends HttpServlet{
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Pitch> list = new UserDAO().getListPitch();
            req.setAttribute("list_pitch", list);
            req.getRequestDispatcher("/about.jsp").forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

}

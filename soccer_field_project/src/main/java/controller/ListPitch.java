package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Pitch;
import model.Product;
import repository.PitchDAO;
import repository.UserDAO;

/**
 * Servlet implementation class ListPitch
 */
@WebServlet("/listPitch")
public class ListPitch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	HttpSession session = req.getSession();
        String username = (String) session.getAttribute("user");
            try {
                    List<Pitch> list = new PitchDAO().getListPitch();
                    req.setAttribute("list_pitch", list);
                    req.setAttribute("username", username);
                    req.getRequestDispatcher("/listPitch.jsp").forward(req, resp);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
    }

}

package controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repository.PitchDAO;
import repository.UserDAO;

@WebServlet("/addPitch")
@MultipartConfig
public class AddPitch extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String imgPre = req.getParameter("imgPitch");
		String name = req.getParameter("pitchName");
        String detail = req.getParameter("pitchDetail");
        String pitchPrice = req.getParameter("pitchPrice");
        String pitchType = req.getParameter("pitchType");
        String img = "images/" + imgPre;

        System.out.println(" img = " + img + " " + pitchPrice + " " + pitchType);
        try {
        	new PitchDAO().addPitch(img, pitchPrice, pitchType, name, detail);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        resp.sendRedirect("listPitch");      
    }

}

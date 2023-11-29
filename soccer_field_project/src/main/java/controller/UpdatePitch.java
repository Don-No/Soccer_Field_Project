package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pitch;
import repository.PitchDAO;
import repository.UserDAO;

@WebServlet("/updatePitch")
public class UpdatePitch extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("pitch_id");
		String img = req.getParameter("uploadImage");
		String imgPre = req.getParameter("img_pre"); 		
		String price = req.getParameter("price");
		String idType = req.getParameter("pitchTypeID");
		String name = req.getParameter("pitchName");
		String detail = req.getParameter("detail");

		String linkImg;

		if (!img.equals("")) {
		    linkImg = "images/" + img;
		} else {
		    linkImg = imgPre;
		}

		PitchDAO dao = new PitchDAO();
		try {
			dao.updatePitch(id, linkImg, price, idType, name, detail);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("listPitch");
	}

}

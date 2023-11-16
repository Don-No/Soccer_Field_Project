package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.UserDAO;

/**
 * Servlet implementation class AddPitch
 */
@WebServlet("/addPitch")
public class AddPitch extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pitchPrice  = req.getParameter("pitchPrice");
        String pitchType = req.getParameter("pitchType");
        String filename="";
        System.out.println("pitchType = " + pitchType);
        String type ="";
        if ("5".equals(pitchType)) {
            type = "1";
        } else if ("7".equals(pitchType)) {
            type = "2";
        } else {
            type = "3";
        }
        System.out.println("pitchType = " + type);
//        Part part = req.getPart("productImage");
//        System.out.println(part);
//        if(part.getSize() != 0){
//            filename = new Feature().getFileName(part);
//            part.write(filename);
//            filename = "images/" + filename;
//        }
        try {
            new UserDAO().addPitch(filename, pitchPrice, type);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        resp.sendRedirect("listPitch");      
    }

}

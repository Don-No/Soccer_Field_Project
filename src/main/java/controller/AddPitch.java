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
import repository.UserDAO;

@WebServlet("/addPitch")
@MultipartConfig
public class AddPitch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String img = "";
        
        Part filePart = request.getPart("img");
        if (filePart != null) {
            img = getFileName(filePart);
            String imagePath = "D:\\Workspace\\Soccer_Field_Project\\src\\main\\webapp\\images\\" + img;
            filePart.write(imagePath);
        }

        String pitchPrice = request.getParameter("pitchPrice");
        String pitchType = request.getParameter("pitchType");

        try {
            new UserDAO().addPitch(img, pitchPrice, pitchType);
            response.sendRedirect("listPitch");
        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("error", "Error adding pitch.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "unknown";
    }
}

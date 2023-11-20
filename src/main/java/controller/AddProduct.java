package controller;

import java.io.File;
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

@WebServlet("/addProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {
    private static final String UPLOAD_DIR = "D:\\Workspace\\Soccer_Field_Project\\src\\main\\webapp\\images\\";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("productName");
        String productPrice = req.getParameter("productPrice");
        String productQuantity = req.getParameter("productQuantity");
        String filename = "";

        Part part = req.getPart("productImage");

        if (part.getSize() != 0) {
            filename = getFileName(part);
            String imagePath = UPLOAD_DIR + filename;
            part.write(imagePath);
            filename = filename;
        }

        try {
            new UserDAO().addProduct(productName, filename, productPrice, productQuantity);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        resp.sendRedirect("admin_product");
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

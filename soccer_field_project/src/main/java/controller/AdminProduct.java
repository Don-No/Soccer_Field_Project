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
import model.Product;
import model.User;
import repository.UserDAO;

@WebServlet("/admin_product")
public class AdminProduct extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("user");
        System.out.println(username);
            try {
                    List<Product> list = new UserDAO().getListProduct();
                    req.setAttribute("list_product", list);
                    req.getRequestDispatcher("/admin_product.jsp").forward(req, resp);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
    }

}

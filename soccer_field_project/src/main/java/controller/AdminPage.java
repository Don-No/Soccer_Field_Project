package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import repository.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/AdminPage"})
public class AdminPage extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String page = "product.html";
        String username = (String) session.getAttribute("user");
        System.out.println(username);
            try {
                    List<User> list = new UserDAO().getListUser();
                    req.setAttribute("list_user", list);
                    req.setAttribute("username", username);
                    req.getRequestDispatcher("/AdminPage.jsp").forward(req, resp);
                //}
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String page = "product.html";
        String username = (String) session.getAttribute("user");
        System.out.println(username);
            try {
                    List<User> list = new UserDAO().getListUser();
                    req.setAttribute("list_user", list);
                    req.setAttribute("username", username);
                    req.getRequestDispatcher("/AdminPage.jsp").forward(req, resp);
                //}
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
    }

}


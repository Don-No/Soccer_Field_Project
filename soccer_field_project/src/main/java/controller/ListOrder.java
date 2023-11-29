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
import model.Order;
import repository.OrderDAO;


@WebServlet("/listOrder")
public class ListOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	HttpSession session = req.getSession();
        String username = (String) session.getAttribute("user");
            try {
                    List<Order> list = new OrderDAO().getListOrder();
                    req.setAttribute("list_order", list);
                    req.setAttribute("username", username);
                    req.getRequestDispatcher("/listOrder.jsp").forward(req, resp);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
    }

}

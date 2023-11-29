package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.OrderDAO;

@WebServlet("/updateOrder")
public class UpdateOrder extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id_order = req.getParameter("order_id");
		String status = req.getParameter("status");
		if ("1".equals(status)) {
		    status = "Unpaid";
		} else if ("2".equals(status)) {
		    status = "Cancel";
		} else if ("3".equals(status)) {
		    status = "Paid";
		}

		System.out.println("status = " + status);
		OrderDAO dao = new OrderDAO();
		try {
			dao.updateOrder(id_order, status);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("cashOrder");
	}

}

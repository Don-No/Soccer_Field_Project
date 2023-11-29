package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/chartDataServlet")
public class ChartDataServlet extends HttpServlet {
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int[] chartData = {10, 19, 3, 5, 2, 3, 8, 12, 15, 7, 10, 5};

        req.setAttribute("chartData", chartData);
        req.getRequestDispatcher("/chart.jsp").forward(req, resp);
    }

}

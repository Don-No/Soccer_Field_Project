package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import entity.Pitch;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.UserRepository;

/**
 * Servlet implementation class Order
 */
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserRepository userService=new UserRepository();
		int pid=Integer.parseInt( request.getParameter("pid"));
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        String[] timeParts = time.split(" - ");
        LocalTime StartTime=LocalTime.parse(timeParts[0]);
        LocalTime startTime = LocalTime.parse(timeParts[0].concat(":00"), formatter);
        LocalTime endTime = LocalTime.parse(timeParts[1].concat(":00"), formatter);
        float heso=userService.getHeso(startTime);
        System.out.println("test"+startTime +" "+heso);
        Pitch pitch=userService.getPitchByID(pid);
        float pitchPrice=(float) (pitch.getPrice()*heso);

		try {
			request.setAttribute("products",userService.getAllProducts());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("date", date);
		request.setAttribute("starttime", startTime);
		request.setAttribute("endtime", endTime);
		request.setAttribute("pitch", pitch);
		request.setAttribute("pitchPrice", pitchPrice);
		request.getRequestDispatcher("Cart.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.UserRepository;

/**
 * Servlet implementation class ViewPitch
 */
public class ViewPitch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		handleupdateDate(request, response);
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		String action=request.getParameter("action");
		 try {
	            switch (action) {
	                case "updateDate":
	                	System.out.println("updateDate");
	                    handleupdateDate(request, response);
	                    break;

	                default:
	                    break;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	private void handleupdateDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserRepository userService = new UserRepository();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String selectedDate = request.getParameter("selectedDate");

		if(selectedDate != null) {
			LocalDate localDate = LocalDate.parse(selectedDate, formatter);
			int pid = Integer.parseInt(request.getParameter("pid"));
		
			request.setAttribute("date", userService.convertToLocalDateToDate(localDate));
			request.setAttribute("availableSlots", userService.getAvailableBookingSlots(pid, localDate));
			request.setAttribute("pitch", userService.getPitchByID(pid));
		}
		else {
			int pid = Integer.parseInt(request.getParameter("pid"));
		
			request.setAttribute("date", userService.convertToLocalDateToDate(LocalDate.now()) );
			request.setAttribute("availableSlots", userService.getAvailableBookingSlots(pid, LocalDate.now()));
			request.setAttribute("pitch", userService.getPitchByID(pid));
		}

		request.getRequestDispatcher("Booking.jsp").forward(request, response);
	}
	}




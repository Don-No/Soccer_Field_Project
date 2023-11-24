package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import entity.ProductData;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.UserRepository;
import service.UserService;

/**
 * Servlet implementation class Checkout
 */
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	List<ProductData> dataList = new ArrayList();
	UserRepository userService =new UserRepository();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
	            // Sleep for 3 seconds (3000 milliseconds)
	            Thread.sleep(2000);
	        } catch (InterruptedException e) {
	            // Handle the exception (e.g., log or print an error message)
	            e.printStackTrace();
	        }
		//doPost(request, response);
		
		String pid= request.getParameter("pid");
		String pitchPrice= request.getParameter("pitchPrice");
		String startTime= request.getParameter("startTime");
		String endTime= request.getParameter("endTime");
		String date= request.getParameter("date");
		request.setAttribute("pitch",userService.getPitchByID(Integer.parseInt(pid)) );
		request.setAttribute("pitchPrice", Float.parseFloat(pitchPrice));
		request.setAttribute("endtime", endTime);
		request.setAttribute("starttime", startTime);
		request.setAttribute("date", date);
		
		System.out.println("lenin"+pid);
		 request.setAttribute("datalist",dataList);
//		 System.out.println(dataList);
		 
	       // response.sendRedirect("checkout.jsp");

	     request.getRequestDispatcher("checkout.jsp").forward(request, response);
	     
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	 @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Retrieve JSON data from the request
		 
        
             UserRepository userService =new UserRepository();
	        BufferedReader reader = request.getReader();
	        StringBuilder sb = new StringBuilder();
	        String line;

	        dataList.clear();
	        String json = reader.readLine();
	        try {
	            // Create ObjectMapper
	            ObjectMapper objectMapper = new ObjectMapper();

	            // Convert JSON to Map
	            Map<String, String> map = objectMapper.readValue(json, new TypeReference<Map<String, String>>() {});

	            // Print the resulting map
	            System.out.println(map);

	            for (Map.Entry<String, String> entry : map.entrySet()) {

	            	dataList.add(new ProductData(entry.getKey(), entry.getValue(),userService.getProductByID(Integer.parseInt(entry.getKey()))));

	        	}
//	            System.out.println(dataList);
	        } catch (IOException e) {
	            e.printStackTrace();
	        } catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
				 	
			  
	        doGet(request, response);
		  }
		 

//	private void handlePlaceOrder(HttpServletRequest request, HttpServletResponse response) {
//		int pitchid=Integer.parseInt(request.getParameter("pid")) ;
//		String starttime=request.getParameter("starttime");
//		String endtime=request.getParameter("endtime");
//		String date=request.getParameter("date");
//		float total=Float.parseFloat(request.getParameter("total"));
//		System.out.println(dataList);
//	}
	 }



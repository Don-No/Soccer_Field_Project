package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import entity.Product;
import entity.ProductData;
import entity.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import repository.UserRepository;

/**
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserRepository userService = new UserRepository();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pitchid = Integer.parseInt(request.getParameter("pid"));
		System.out.println(pitchid);
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		String date = request.getParameter("date");
		float total = Float.parseFloat(request.getParameter("total"));
		String datalist = request.getParameter("datalist");
		float bookingprice = Float.parseFloat(request.getParameter("bookingprice"));
		List<ProductData> datalist1 = parseProductDataList(datalist);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		LocalTime startTime = LocalTime.parse(starttime.concat(":00"), formatter);
		LocalTime endTime = LocalTime.parse(endtime.concat(":00"), formatter);
		DateTimeFormatter formatterd = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		System.out.println(date);

		LocalDate localDate = LocalDate.parse(date, formatterd);
		float heso = userService.getHeso(startTime);
		System.out.println(datalist1);
		HttpSession session = request.getSession();
		UserEntity account = (UserEntity) session.getAttribute("acc");
		for (ProductData productData : datalist1) {
			try {
				userService.updateQuantityProduct(productData.getProductId(), productData.getQuantity());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			System.out.println(userService.InsertOrder(pitchid, bookingprice,localDate, startTime, endTime,  heso, datalist1,account,total));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("PlaceOrder");
	}

	protected List<ProductData> parseProductDataList(String inputString) {
		List<ProductData> productDataList = new ArrayList<>();

		Pattern pattern = Pattern.compile(
				"ProductData \\[productId=(\\d+), quantity=(\\d+), product=Product \\[productID=(\\d+), productName=([^,]+), img=([^,]+), price=(\\d+\\.\\d+), quantity=(\\d+)]");
		Matcher matcher = pattern.matcher(inputString);

		while (matcher.find()) {
			int productId = Integer.parseInt(matcher.group(1));
			int quantity = Integer.parseInt(matcher.group(2));
			int productID = Integer.parseInt(matcher.group(3));
			String productName = matcher.group(4);
			String img = matcher.group(5);
			double price = Double.parseDouble(matcher.group(6));
			int productQuantity = Integer.parseInt(matcher.group(7));

			Product product = new Product(productID, productName, img, price, productQuantity);
			ProductData productData = new ProductData(String.valueOf(productId), String.valueOf(quantity), product);

			productDataList.add(productData);
		}

		return productDataList;
	}

}

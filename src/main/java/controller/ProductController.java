package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pitch;
import model.Product;
import repository.PitchDAO;
import repository.ProductDAO;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ProductController
 */
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductController() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* List Pitch */
		ProductDAO dao = new ProductDAO();

		List<Product> listP = dao.getAllProduct();

		request.setAttribute("listP", listP);
		request.getRequestDispatcher("Category.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

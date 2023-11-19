package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pitch;
import repository.PitchDAO;

/**
 * Servlet implementation class PitchController
 */
public class PitchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* List Pitch */
		PitchDAO dao = new PitchDAO();

		List<Pitch> list = dao.getAllPitch();

		request.setAttribute("list", list);
		request.getRequestDispatcher("about.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("search");

		/*
		 * search
		 */
		PitchDAO dao = new PitchDAO();

		List<Pitch> list = dao.searchPitch(search);

		request.setAttribute("list", list);
		request.getRequestDispatcher("about.jsp").forward(request, response);
	}
}

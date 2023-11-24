package controller;

import java.io.IOException;
import java.sql.SQLException;

import entity.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repository.UserRepository;

/**
 * Servlet implementation class ProfileUser
 */
@WebServlet(name="ProfileUser",value = {"/profileUser"})
public class ProfileUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 String action = request.getParameter("view");
	        try {
	            switch (action) {
	                case "viewProfile":
	                    handleViewProfile(request, response);
	                    break;
	                case "viewChangePassword":
	                    handleViewChangePassword(request, response);
	                    break;
	                default:
	                    break;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}


	private void handleViewChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 HttpSession session = request.getSession();
	        UserEntity account = (UserEntity) session.getAttribute("acc");

	        if(account!=null){

	            request.setAttribute("infomation", account);
	             request.setAttribute("hide", "hide");
	            request.setAttribute("show", "show");


	            request.getRequestDispatcher("profileUser.jsp").forward(request, response);
	        }else {
	            response.sendRedirect("LoginUser");
	        }
	}


	public void handleChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        UserEntity account = (UserEntity) session.getAttribute("acc");
        UserRepository userService = new UserRepository();
        if(account!=null){
            String OldPass = request.getParameter("oldpassword");
            String NewPass = request.getParameter("newpassword");




//            if(OldPass==null){
//                request.getRequestDispatcher("profileUser.jsp").forward(request, response);
//            } else {

                if(OldPass.equals(account.getPassword()))
                {
                	String username=account.getUsername();
                    UserEntity user =new UserEntity(username,NewPass);
                    userService.changePassword(user);
                    request.setAttribute("success", "Change password success");
                    request.setAttribute("hide", "hide");
                    request.getRequestDispatcher("profileUser.jsp").forward(request, response);
                } else {
                    request.setAttribute("msg", "Old password incorrect!");
                    request.setAttribute("hide", "hide");
                    request.getRequestDispatcher("profileUser.jsp").forward(request, response);
                }

//            }


        }else {
            response.sendRedirect("loginCustomer");
        }
    }


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "updateProfile":
                    handleUpdateProfile(request, response);
                    break;
                case "changePassword":
                    handleChangePassword(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

	}
	 public void handleUpdateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

	        HttpSession session = request.getSession();
	        UserEntity account = (UserEntity) session.getAttribute("acc");
	        UserRepository userService = new UserRepository();

	        if(account!=null){
	            String name = request.getParameter("fullname");
	            String email = request.getParameter("email");
	            String phone = request.getParameter("phonenumber");
	            String address = request.getParameter("address");
	            int id= account.getUserID();
	            UserEntity user = new UserEntity(id, name, email, address, phone);
	            userService.updateProfile(user);
	            UserEntity userupdate = userService.getUserById(id);
	            request.setAttribute("infomation", userupdate);
	            request.setAttribute("msgProfile", "Update Profile Success");
	            request.setAttribute("show", "none");
	            request.getRequestDispatcher("profileUser.jsp").forward(request, response);
//	            handleViewProfile(request, response);

	        }else {
	            response.sendRedirect("LoginUser");
	        }
	    }


	public void handleViewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        UserEntity account = (UserEntity) session.getAttribute("acc");

        if(account!=null){

            request.setAttribute("infomation", account);
            request.setAttribute("show", "none");
            System.out.println(account.getEmail());
            request.getRequestDispatcher("profileUser.jsp").forward(request, response);
        }else {
            response.sendRedirect("LoginUser");
        }
    }

}

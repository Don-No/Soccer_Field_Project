package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import model.Account;
import model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/login"})
public class Login extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("rem");
        boolean check = false;
        try {
            List<Account> list_acc = new UserDAO().getListAcc();
          for (Account acc : list_acc) {
            if(acc.getUsername().equals(username)&acc.getPassword().equals(password)){
                if(remember!= null){
                    Cookie cookie = new Cookie("user", username);
                    cookie.setMaxAge(3000);
                    resp.addCookie(cookie);
                }
                HttpSession session = req.getSession();
                session.setAttribute("user", username);
                break;
            }
            else {
            	req.getRequestDispatcher("/login.html").forward(req, resp);
            }
            
          }
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

            req.setAttribute("nofication_in", "0" );
            req.getRequestDispatcher("/product.html").forward(req, resp);
        
    }
}


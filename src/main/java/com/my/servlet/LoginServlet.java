package com.my.servlet;

import java.io.IOException;

import com.my.dao.UserDao;
import com.my.db.DBConnect;
import com.nt.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email= request.getParameter("em");
		String password = request.getParameter("ps");
		User user = new User();
		HttpSession session=request.getSession();
		
		//admin login static value
		if ("admin@gmail.com".equals(email) && "admin@121".equals(password)) {
			session.setAttribute("userobj", user);
			user.setRole("admin");
			response.sendRedirect("admin.jsp");
		}
		else {
			//user login after user successfully registered
			UserDao dao=new UserDao(DBConnect.getConnection());
			User u=dao.userLogin(email, password);
			if(u!=null) {
				session.setAttribute("userobj", u);
				u.setRole("user");
				response.sendRedirect("home.jsp");
			}else {
				
				session.setAttribute("succMsg","Invalid Email or password");
				response.sendRedirect("login.jsp");
			}
			
		}
	}

}

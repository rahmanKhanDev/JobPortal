package com.my.servlet;

import java.io.IOException;

import com.my.dao.UserDao;
import com.my.db.DBConnect;
import com.nt.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String qualification=request.getParameter("qua");
		String password=request.getParameter("ps");
		
		UserDao dao=new UserDao(DBConnect.getConnection());
		User user= new User(name,email,password,qualification,"user");
	
		boolean f=dao.UserRegister(user);
		HttpSession session=request.getSession();
		
		if(f) {
			session.setAttribute("succMsg","Registration successfull, please login..");
			response.sendRedirect("signup.jsp");
		}else {
			session.setAttribute("succMsg","Something went wrong on server");
			response.sendRedirect("signup.jsp");
		}
	}

}

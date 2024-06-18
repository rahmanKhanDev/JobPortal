package com.my.servlet;

import java.io.IOException;

import com.my.dao.ApplyDao;
import com.my.dao.JobDao;
import com.my.dao.UserDao;
import com.my.db.DBConnect;
import com.nt.entity.Job;
import com.nt.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ApplyServlet
 */
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int jobId = Integer.parseInt(request.getParameter("jodId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		
        System.out.println("UserId:"+userId+" jobId:"+jobId);
		UserDao userDao = new UserDao(DBConnect.getConnection());
		User user = userDao.userInfoForAdmin(userId);

		JobDao jobDao = new JobDao(DBConnect.getConnection());
		Job job = jobDao.getJobBYIdForAdmin(jobId);

		ApplyDao applyDao = new ApplyDao(DBConnect.getConnection());
		boolean f = applyDao.jobApplied(user, job);
		HttpSession session = request.getSession();
		if (f) {
			session.setAttribute("succMsg", "Applied Successfully..");
			response.sendRedirect("home.jsp");
		} else {
			session.setAttribute("succMsg", "Already applied or Something went wrong on server");
			response.sendRedirect("home.jsp");
		}
	}

}

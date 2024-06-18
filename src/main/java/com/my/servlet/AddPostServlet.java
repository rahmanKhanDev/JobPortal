package com.my.servlet;

import java.io.IOException;

import com.my.dao.JobDao;
import com.my.db.DBConnect;
import com.nt.entity.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//service class in a way
/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/addJob")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPostServlet() {
		super();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			String desc = request.getParameter("desc");

			Job j = new Job();
			j.setTitle(title);
			j.setCategory(category);
			j.setDescription(desc);
			j.setLocation(location);
			j.setStatus(status);

			JobDao dao = new JobDao(DBConnect.getConnection());
			boolean f = dao.addJobs(j);
			HttpSession session = request.getSession();
			
			 
				if (f) {
					session.setAttribute("succMsg", "Job Post Successfully..");
					response.sendRedirect("add_jobs.jsp");
				} else {
					session.setAttribute("succMsg", "Something went wrong on server");
					response.sendRedirect("add_jobs.jsp");
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

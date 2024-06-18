package com.my.servlet;

import java.io.IOException;

import com.my.dao.JobDao;
import com.my.db.DBConnect;
import com.nt.entity.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateJobServlet
 */
public class UpdateJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		String status = request.getParameter("status");
		String desc = request.getParameter("desc");
		
		//Job object and setting value to Job feild which will be used in JobDao fro updation
		Job j=new Job();
		j.setId(id);
		j.setTitle(title);
		j.setLocation(location);
		j.setCategory(category);
		j.setStatus(status);
		j.setDescription(desc);
		
		JobDao dao = new JobDao(DBConnect.getConnection());
		boolean f = dao.updateJob(j);
		HttpSession session = request.getSession();
		
		 
			if (f) {
				session.setAttribute("succMsg", "Job Updated Successfully..");
				response.sendRedirect("view_jobs.jsp");
			} else {
				session.setAttribute("succMsg", "Something went wrong on server");
				response.sendRedirect("view_jobs.jsp");
			}
		
	}

}

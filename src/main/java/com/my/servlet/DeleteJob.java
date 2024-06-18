package com.my.servlet;

import java.io.IOException;

import com.my.dao.JobDao;
import com.my.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteJob
 */
public class DeleteJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteJob() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
   int id=Integer.parseInt(request.getParameter("id"));
   JobDao dao=new JobDao(DBConnect.getConnection());
        boolean f=dao.deleteJob(id);
        HttpSession hs=request.getSession();
        if(f) {
        	hs.setAttribute("succMsg","Job deleted successfully..");
        	response.sendRedirect("view_jobs.jsp");
        }else {
        	hs.setAttribute("succMsg","somthing went wrong on server.");
        	response.sendRedirect("view_jobs.jsp");
        }
	}

}

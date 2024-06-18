<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.my.db.DBConnect,com.my.dao.JobDao, java.util.List,com.nt.entity.Job"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="all_components/all_css.jsp"%>
<meta charset="UTF-8">
<title>Admin: View Job</title>
</head>
<body style="background-color: #f0f1f2;">

  <%--restricting users to acces this page unless it is admin --%>
	<c:if test="${userobj.role ne 'admin' }">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<%@ include file="all_components/navBar.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12 ">
				<h5 class="text-center text-primary">All Jobs</h5>

				<%--printing updation msg --%>
				<c:if test="${not empty succMsg }">
					<div class="alert alert-success" role="alert">${succMsg}</div>

					<c:remove var="succMsg" />
				</c:if>

				<%--getting all job details  --%>
				<%
				JobDao dao = new JobDao(DBConnect.getConnection());
				List<Job> list = dao.getAllJobs();
				for (Job j : list) {
				%>

				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>



						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3 col-4">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3 col-4">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>
							<div class="form-group col-md-3 col-4">
								<input type="text" class="form-control form-control-sm"
									value="Status: <%=j.getStatus()%>" readonly>
							</div>
						</div>
						<h6>
							Public Date :<%=j.getPdate()%></h6>
						<div class="text-center">
						<%--adding applicnts button --%>
							<a
								href="applicants.jsp?jobId=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Applicants</a>
						
							<a href="edit_job.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit Job</a> <a
								href="delete?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Delete</a>
								
						</div>
					</div>
				</div>

				<%
				}
				%>



			</div>
		</div>
	</div>
</body>
</html>
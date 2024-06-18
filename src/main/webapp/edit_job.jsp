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
<title>Edit Jobs</title>
</head>
<body style="background-color: #f0f1f2;">
	
	<%--restricting users to acces this page unless it is admin --%>
	<c:if test="${userobj.role ne 'admin' }">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	
	<%@ include file="all_components/navBar.jsp"%>

	<%--creating from to post job --%>
	<div class="container p2 login-page">
		<div class="col-md-10  offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-sucess">
						<i class="fas fa-user-friends fa-3x"></i>

						<%--invoking getJobById() by receving id info from view_job.jsp url   --%>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						JobDao dao = new JobDao(DBConnect.getConnection());
						Job j = dao.getJobBYId(id);
						%>


						<h5>Edit Jobs</h5>


					</div>
					<form action="updateJob" method="Post">
						
						<%--hidden input to update jo data --%>
						<input type="hidden" value="<%=j.getId() %>" name="id">
						
						
						<div class="form-group">
							<label>Enter Title</label><input type="text" name="title"
								required="required" class="form-control"
								value="<%=j.getTitle()%>">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4 col-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inLineFormCustomSelectPref">
									<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
									<option value="Odisha">Odhisa</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujrat">Gujrat</option>
									<option value="Bhubneshwar">Bhubneshwar</option>
									<option value="Delhi">Delhi</option>
									<option value="Chennai">Chennai</option>
									<option value="Hyderabad">Hyderabad</option>

								</select>
							</div>
							<div class="form-group col-md-4 col-4">
								<label>Category</label> <select name="category"
									class="custom-select" id="inLineFormCustomSelectPref">
									<option value="<%=j.getCategory() %>"><%=j.getCategory() %>.</option>
									<option value="IT">It</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<div class="form-group col-md-4 col-4">
								<label>Status</label> <select name="status" class="form-control">
									<option value="<%=j.getStatus() %>" class="Active"><%=j.getStatus() %></option>
									<option value="Active" class="Active">Active</option>
									<option value="Inactive" class="Inactive">Inactive</option>
								</select>
							</div>
						</div>
						<div class="form-group">

							<label>Enter Description</label><br>
							<textarea required rows="6" cols="35" name="desc"
								class="from-control"><%=j.getDescription() %></textarea>
						</div>
						<button class="btn btn-success">Update Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
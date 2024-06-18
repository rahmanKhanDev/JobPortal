<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="all_components/all_css.jsp"%>
<meta charset="UTF-8">
<title>Job Post</title>
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

						<h5>Add Jobs</h5>

						<c:if test="${not empty succMsg }">
							<div class="alert alert-success" role="alert">${succMsg}</div>

							<c:remove var="succMsg" />
						</c:if>
					</div>
					<form action="addJob" method="Post">
						<div class="form-group">
							<label>Enter Title</label><input type="text" name="title"
								required="required" class="form-control">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4 col-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inLineFormCustomSelectPref">
									<option selected>Select...</option>
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
									<option selected>Select...</option>
									<option value="IT">It</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<div class="form-group col-md-4 col-4">
								<label>Status</label> <select name="status" class="form-control">
									<option value="Active" class="Active">Active</option>
									<option value="Inactive" class="Inactive">Inactive</option>
								</select>
							</div>
						</div>
						<div class="form-group">

							<label>Enter Description</label><br>
							<textarea required rows="6" cols="35" name="desc"
								class="from-control"></textarea>
						</div>
						<button class="btn btn-success">Publish Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
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
<title>User: View Job</title>
</head>
<body>

	<%-- 	restricting users to acces this page unless it is admin--%>
	<c:if test="${ empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@ include file="all_components/navBar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12 ">
				<h5 class="text-center text-primary">All Jobs</h5>
				<%--success msg for apply --%>
				<c:if test="${not empty succMsg }">
					<div class="alert alert-success" role="alert">${succMsg}</div>

					<c:remove var="succMsg" />
				</c:if>

				<%--printing updation msg 
				<c:if test="${not empty succMsg }">
					<div class="alert alert-success" role="alert">${succMsg}</div>

					<c:remove var="succMsg" />
				</c:if>
--%>
				<div class="card">
					<div class="card-body">
						<form class="form-inline mb-1" action="more_view.jsp" method="get">
							<div class="form-group col-md-5 col-5 mt-1">
								<h6>Location</h6>
							</div>
							<div class="form-group col-md-4 col-5 mt-1">
								<h6 class="ml-0">Category</h6>
							</div>

							<div class="form-group col-md-4  col-4">
								<select name="location" class="custom-select"
									id="inLineFormCustomSelectPref">
									<option value="lo" selected>Select...</option>
									<option value="Odisha">Odhisa</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujrat">Gujrat</option>
									<option value="Bhubneshwar">Bhubneshwar</option>
									<option value="Delhi">Delhi</option>
									<option value="Chennai">Chennai</option>
									<option value="Hyderabad">Hyderabad</option>

								</select>
							</div>



							<div class="form-group col-md-4 col-4 ml-4">
								<select name="category" class="custom-select"
									id="inLineFormCustomSelectPref">
									<option value="ca" selected>Select...</option>
									<option value="IT">It</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<button class="btn btn-success ml-3">Submit</button>
						</form>
					</div>
				</div>

				<%--getting all job details by location and category --%>
				<%
				JobDao dao = new JobDao(DBConnect.getConnection());
				List<Job> list = dao.getAllJobsForUser();
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
							<div class="form-group  col-md-3 col-4">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3 col-4">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>

							<%--sending userid and jodid to be stored in db and to be shown to admin --%>
							<div class="text-center ">
								<a href="apply?jodId=<%out.println(j.getId()); %>&userId=${userobj.id}"
									class="btn btn-sm bg-success text-white mb-1">Apply</a>
							</div>

						</div>
					</div>
					<h6 class="ml-2">
						Public Date :<%=j.getPdate()%></h6>
					<%--view more and apply button --%>

					<div class="text-center ">
						<a href="one_view.jsp?id=<%=j.getId()%>"
							class="btn btn-sm bg-success text-white mb-1">View More</a>
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
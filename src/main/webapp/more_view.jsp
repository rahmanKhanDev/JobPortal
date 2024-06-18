<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.my.db.DBConnect,com.my.dao.JobDao, java.util.List,com.nt.entity.Job,java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="all_components/all_css.jsp"%>
<meta charset="UTF-8">
<title>View: Jobs</title>
</head>
<body style="background-color: #f0f1f2;">

	<%--restricting users to acces this page unless it is admin --%>
	<c:if test="${ empty userobj }">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@ include file="all_components/navBar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h5>All Jobs</h5>
				<%
				String location = request.getParameter("location");
				String category = request.getParameter("category");
				String msg="";
				JobDao dao=new JobDao(DBConnect.getConnection());
				List<Job> list=null;
				
				if("lo".equals(location)&&"ca".equals(category)){
					list=new ArrayList<>();
					msg="Jobs not available";
				}else if("lo".equals(location)||"ca".equals(category)){
					list=dao.getJobsWithLocationORCategory(location, category);
					
				}else{
					list=dao.getJobsWithLocationAndCategory(location, category);
				}
				if(list.isEmpty()){%>
					<h5 class="text-center text-danger">Jobs not available</h5>
				<% }
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

							</div>
							<h6>
								Public Date :<%=j.getPdate()%></h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white mb-1">View More</a>
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
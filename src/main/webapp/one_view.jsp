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
<title>User: Single Job</title>
</head>
<body style="background-color: #f0f1f2;">

<%-- 	restricting users to acces this page unless it is admin --%>
	<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@ include file="all_components/navBar.jsp"%>

	<%--creating from to post job --%>
	<div class="container ">
		<div class="row">
			<div class="col-md-12">



				<%--invoking getJobById() by receving id info from view_job.jsp url   --%>
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobDao dao = new JobDao(DBConnect.getConnection());
				Job j = dao.getJobBYId(id);
				%>
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%>.
						</p>
						<br>

						<div class="form-row">
							<div class="form-group col-md-3 col-6">
								<input class="form-control form-control-sm" type="text"
									value="Location:<%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3 col-6">
								<input class="form-control form-control-sm" type="text"
									value="Category:<%=j.getCategory()%>" readonly>
							</div>
						</div>
						<h6>
							Publish date:<%=j.getPdate().toString()%></h6>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	 import="com.my.db.*,com.my.dao.*, java.util.List,com.nt.entity.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="all_components/all_css.jsp"%>
<meta charset="UTF-8">
<title>Job: Applicants</title>
</head>
<body style="background-color: #f0f1f2;">

	<%--restricting users to acces this page unless it is admin --%>
	<c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@ include file="all_components/navBar.jsp"%>



	<%-- displaying applied user info --%>

	<div class="container">
		<div class="row">
			<div class="col-md-12 ">
				<h5 class="text-center text-primary">All Applicants</h5>


				<%--getting all User details  --%>
				<%
				
				
				int jobId = Integer.parseInt(request.getParameter("jobId"));
				GetAppliedUserDao dao = new GetAppliedUserDao(DBConnect.getConnection());
			
				List<JobAppliedUserInfo> list = dao.getAppliedUserInfo(jobId);
				for (JobAppliedUserInfo j : list) {
				%>

				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa-solid fa-person"></i>
						</div>

						<br>
						<div class="form-row">
							<div class="form-group col-md-3 col-4">
								<input type="text" class="form-control form-control-sm"
									value="Name:<%=j.getUname()%>" readonly>
							</div>
							<div class="form-group col-md-3 col-8">
								<input type="text" class="form-control form-control-sm"
									value="Email:<%=j.getEmail()%>" readonly>
							</div>
							<div class="form-group col-md-3 col-4">
								<input type="text" class="form-control form-control-sm"
									value="Qualification:<%=j.getQualification()%>" readonly>
							</div>
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
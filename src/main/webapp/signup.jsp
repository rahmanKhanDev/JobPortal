<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<%@ include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navBar.jsp"%>
	<div class="container-fluid login-page">
		<div class="row p4">
			<div class="col-md-4  col-15 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Registartion</h5>

							<%--gettinng register succss msg and printing --%>
							<c:if test="${not empty succMsg }">
								<h6 class="text-center text-danger text-center">${succMsg}</h6>
								<c:remove var="succMsg" />
							</c:if>

						</div>




						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputName">Enter Full Name</label><input
									type="text" required="required" class="form-control"
									id="exampleInputName" aria-describedby="emailHelp" name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputQua">Enter Qualification</label><input
									type="text" required="required" class="form-control"
									id="exampleInputQua" aria-describedby="emailHelp" name="qua">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail">Enter Email</label><input
									type="email" required="required" class="form-control"
									id="exampleInputEmail" aria-describedby="emailHelp"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword">Enter Password</label><input
									type="password" required="required" class="form-control"
									id="exampleInputPassword" name="ps">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</buttoN>

						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="all_components/all_css.jsp"%>
<style>
.back-img {
	background: url(images/j6.jpg);
	width: 100%;
	height: 85vh;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	
}

</style>
</head>
<body style="background-color:#f0f1f2;">

<%--restricting users to acces this page unless it is admin --%>
	<c:if test="${userobj.role ne 'admin' }">
	<c:redirect url="login.jsp"></c:redirect>
	
	</c:if>	<%@ include file="all_components/navBar.jsp"%>
	
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-custom p-1">Welcome Admin</h1>
		</div>
	</div>
</body>
</html>
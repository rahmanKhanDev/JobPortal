<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
		
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Job Portal</title>
<%@ include file="all_components/all_css.jsp"%>

<style>
.back-img {
	background: url(images/j4.jpg);
	width: 100%;
	height: 85vh;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}
</style>
</head>
<body>
	<%@ include file="all_components/navBar.jsp"%>
	<div class="container-fluid back-img ">
		<div class="text-center">
			<h1 class="text-custom p4">
				<i class="fa fa-book " aria-hidden="true"></i>Online Job Portal
			</h1>
		</div>
	</div>

<%@ include file="all_components/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="component/allcss.jsp" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.paint-card{
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3)
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div class="container p-4">
<div class="row">
<div class="col-md-4 offset-md-4">
	<div class="card">
	<p class="text-center fs-3">Change Password</p>
	
	<c:if test="${empty userObj}">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty sucMsg}">
	<p class="text-center text-success fs-5">${sucMsg}</p>
	<c:remove var="sucMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty errorMsg}">
	<p class="text-center text-danger fs-5">${errorMsg}</p>
	<c:remove var="errorMsg" scope="session"/>
	</c:if>
	<div class="card-body">
		<form action="user_change_password" method="post">
		<div class="md-3">
		<label>Enter New Password</label>
		<input name="newPassword" required type="text" class="form-control">
		</div>
		
		<div class="md-3">
		<label>Enter Old Password</label>
		<input name="oldPassword" required type="text" class="form-control">
		</div>
		
		<input type="hidden" value="${userObj.id}" name="uid">
		<button class="btn btn-success col-md-12 mt-3">Change Password</button>
		</form>
	</div>
	</div>
</div>
</div>
</div>
</body>
</html>
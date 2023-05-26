<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="../component/allcss.jsp" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 .paint-card{ 
 	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3) 
 } 
 </style>
</head>
<body>
<c:if test="${empty docObj}">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp" %>

<div class="container p-4">
<div class="row">
<div class="col-md-4">
	<div class="card">
	<p class="text-center fs-3">Change Password</p>
	
	<c:if test="${not empty sucMsg}">
	<p class="text-center text-success fs-5">${sucMsg}</p>
	<c:remove var="sucMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty errorMsg}">
	<p class="text-center text-danger fs-5">${errorMsg}</p>
	<c:remove var="errorMsg" scope="session"/>
	</c:if>
	<div class="card-body">
		<form action="../user_change_password" method="post">
		<div class="md-3">
		<label>Enter New Password</label>
		<input name="newPassword" required type="text" class="form-control">
		</div>
		
		<div class="md-3">
		<label>Enter Old Password</label>
		<input name="oldPassword" required type="text" class="form-control">
		</div>
		
		<input type="hidden" value="${docObj.id}" name="uid">
		<button class="btn btn-success col-md-12 mt-3">Change Password</button>
		</form>
	</div>
	</div>
</div>

<div class="col-md-5 offset-md-2">
<div class="card paint-card">
	<div class="card-body">
	
	<p class="text-center fs-3">Edit Profile</p>
	<form action="../doctor_update_profile" method="post">
	
	<c:if test="${not empty sucProMsg}">
		<p class="text-center text-success fs-5">${sucProMsg }</p>
		<c:remove var="sucProMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty errorProMsg}">
		<p class="text-center text-danger fs-5">${errorProMsg }</p>
		<c:remove var="errorProMsg" scope="session"/>
	</c:if>
		
		<div class="mb-3">
			<label class="form-label">Fullname</label>
			<input type="text" required name="fullname" value="${docObj.fullname}" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">DOB</label>
			<input type="date" required name="dob" value="${docObj.dob}" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">Qualification</label>
			<input type="text" required name="qualification" value="${docObj.qualification}"class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">Specialist</label>
			<select required name="specialist" class="form-control">
				<option>${docObj.specialist}</option>
				<%
 				SpecialistDAO dao = new SpecialistDAO(DBConnect.getConn());
 				List<Specialist> ls = dao.getAllSpecialist();
 				for(Specialist s: ls){
 				%> 
 					<option><%= s.getSpecialName()%></option> 
 				<%
 				}
				%>
			</select>
		</div>
		<div class="mb-3">
			<label class="form-label">Email</label>
			<input type="email" name="email" value="${docObj.email }" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">Mob no</label>
			<input type="text" required name="mobNo" value="${docObj.mobNo }" class="form-control">
		</div>	
		
		<input type="hidden" name="id" value="${docObj.id}">
		<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</div>
</div>
</div>
</div>

</body>
</html>
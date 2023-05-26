<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>

<style>
.paint-card{
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3)
}
.backImg{
	background: linear-gradient(rgba(0,0,0,.4),rgba(0,0,0,.4)),
	url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div class="container-fluid p-5 backImg">
<p class="text-center text-white fs-2"></p>
</div>

<div class="container p-3">
<div class="row">
	<div class="col-md-6 p-3">
	<img alt="" src="img/doc5.jpg">
	</div>
	<div class="col-md-6">
		<div class="card paint-card">
		<div class="card-body">
			<p class="text-center fs-3">User Appointment</p>
			
			<c:if test="${not empty sucMsg}">
			<p class="text-center text-success fs-5">${sucMsg}</p>
			<c:remove var="sucMsg" scope="session"/>
			</c:if>
			<c:if test="${not empty errorMsg}">
			<p class="text-center text-danger fs-5">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session"/>
			</c:if>
			
			<form class="row g-3" action="add_appointment" method="post">
			<input type="hidden" name="userId" value="${userObj.id}" >
			
			<div class="col-md-6">
				<label class="form-label">Fullname</label>
				<input type="text" name="fullname" required class="form-control">
			</div>
			<div class="col-md-6">
			<label>Gender</label>
			<select name="gender" required class="form-control">
				<option value="male">Male</option>
				<option value="female">Female</option>
			</select>
			</div>
			<div class="col-md-6">
				<label class="form-label">Age</label>
				<input required type="number" name="age" class="form-control">
			</div>
			<div class="col-md-6">
				<label class="form-label">Appointment Date</label>
				<input required type="date" name="appointmentDate" class="form-control">
			</div>
			<div class="col-md-6">
				<label class="form-label">Email</label>
				<input required type="email" name="email" class="form-control">
			</div>
			<div class="col-md-6">
				<label class="form-label">Phone No</label>
				<input required type="number" name="phoneNo" class="form-control">
			</div>
			<div class="col-md-6">
				<label class="form-label">Deseases</label>
				<input required type="text" name="deseases" class="form-control">
			</div>
			<div class="col-md-6">
			<label class="form-label">Doctor</label>
			<select name="doctorId" required class="form-control">
				<option value="">--select--</option>
				<%
				DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
				List<Doctor> lsDoctor = dao.getAllDoctor();
				for(Doctor d: lsDoctor){
				%>
				<option value="<%=d.getId()%>"><%=d.getFullname() %> (<%=d.getSpecialist() %>) </option>
				<%
				}
				%>
				
			</select>
			</div>
			
			<div class="col-md-12">
				<label>Full Address</label>
				<textarea rows="3" cols="" name="address" class="form-control" required></textarea>
			</div>
			
			<c:if test="${empty userObj}">
			<a href="user_login.jsp"
			class="col-md-6 offset-md-3 btn btn-success">Submit</a>
			</c:if>
			<c:if test="${not empty userObj}">
			<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
			</c:if>
			</form>
		</div>
		</div>
	</div>
</div>
</div>

</body>
</html>
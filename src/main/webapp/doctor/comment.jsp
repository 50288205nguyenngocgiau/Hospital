<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
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
 .backImg{
	background: linear-gradient(rgba(0,0,0,.4),rgba(0,0,0,.4)),
	url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
 </style> 
</head>
<body>
<c:if test="${empty docObj}">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>

<div class="container-fluid p-5 backImg">
<p class="text-center text-white fs-2"></p>
</div>

<div class="container p-3">
<div class="row">

	<div class="col-md-6 offset-md-3">
	<div class="card paint-card">
		<div class="card-body">
		
		<p class="text-center fs-4">Patient Comment</p>
		
		<%
		int id = Integer.parseInt(request.getParameter("id"));
		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
		Appointment ap = dao.getAppointmentById(id);
		%>
		<form action="../update_comment" method="post" class="row">
			<div class="col-md-6">
			<label>Patient Name</label>
			<input value="<%=ap.getFullname() %>" readonly type="text" class="form-control">
			</div>
			<div class="col-md-6">
			<label>Age</label>
			<input value="<%=ap.getAge() %>" readonly type="text" class="form-control">
			</div>
			<div class="col-md-6">
			<label>Phone No</label>
			<input value="<%=ap.getPhoneNo() %>" readonly type="text" class="form-control">
			</div>
			<div class="col-md-6">
			<label>Deseases</label>
			<input value="<%=ap.getDeseases() %>" readonly type="text" class="form-control">
			</div>
			<div class="col-md-12">
			<label>Comment</label>
			<textArea rows="3" cols="" required name="comment" class="form-control"></textArea>
			</div>
			<input name="id" type="hidden" value="<%=ap.getId()%>">
			<input name="did" type="hidden" value="<%=ap.getDoctorId()%>">
			
			<button class="col-md-6 mt-3 offset-md-3 btn btn-primary">Submit</button>
		</form>
		</div>
	</div>
	</div>
</div>
</div>

</body>
</html>
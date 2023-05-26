<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
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
<%@include file="navbar.jsp" %>

 <div class="container-fluid p-3"> 
 <div class="row"> 
 	<div class="col-md-4 offset-md-4"> 
 	<div class="card card-paint"> 
 		<div class="card-body"> 
 		<p class="fs-3 text-center">Edit Doctor Detail</p> 
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session"/>
		</c:if>
		<c:if test="${not empty sucMsg}">
			<p class="fs-3 text-center text-danger">${sucMsg}</p>
			<c:remove var="sucMsg" scope="session"/>
		</c:if>
		
		<%
		int id = Integer.parseInt(request.getParameter("id"));
		DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
		Doctor doctor = dao2.getDoctorById(id);
		%>
		
		<form action="../update_doctor" method="post">
		
		<div class="mb-3">
			<label class="form-label">Fullname</label>
			<input type="text" required name="fullname" class="form-control" value="<%=doctor.getFullname() %>">
		</div>
		<div class="mb-3">
			<label class="form-label">DOB</label>
			<input type="date" required name="dob" class="form-control" value="<%=doctor.getDob() %>">
		</div>
		<div class="mb-3">
			<label class="form-label">Qualification</label>
			<input type="text" required name="qualification" class="form-control" value="<%=doctor.getQualification() %>">
		</div>
		<div class="mb-3">
			<label class="form-label">Specialist</label>
			<select required name="specialist" class="form-control">
				<option><%=doctor.getSpecialist() %> </option>
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
			<input type="email" required name="email" class="form-control" value="<%=doctor.getEmail() %>">
		</div>
		<div class="mb-3">
			<label class="form-label">Mob no</label>
			<input type="text" required name="mobNo" class="form-control" value="<%=doctor.getMobNo() %>">
		</div>
		<div class="mb-3">
			<label class="form-label">Password</label>
			<input type="text" required name="password" class="form-control" value="<%=doctor.getPassword() %>">
		</div>
		
		<input type="hidden" name="id" value="<%=doctor.getId() %>">
		<button type="submit" class="btn btn-primary col-md-12">Update</button>
		</form>
		</div>
	</div>
	</div>
	
	
</div>
</div>
</body>
</html>
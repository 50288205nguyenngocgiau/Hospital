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
 	<div class="col-md-4"> 
 	<div class="card card-paint"> 
 		<div class="card-body"> 
 		<p class="fs-3 text-center">Add Doctor</p> 
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session"/>
		</c:if>
		<c:if test="${not empty sucMsg}">
			<p class="fs-3 text-center text-success">${sucMsg}</p>
			<c:remove var="sucMsg" scope="session"/>
		</c:if>
		
		<form action="../add_doctor" method="post">
		
		<div class="mb-3">
			<label class="form-label">Fullname</label>
			<input type="text" required name="fullname" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">DOB</label>
			<input type="date" required name="dob" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">Qualification</label>
			<input type="text" required name="qualification" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">Specialist</label>
			<select required name="specialist" class="form-control">
				<option>-- select --</option>
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
			<input type="email" required name="email" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">Mob no</label>
			<input type="text" required name="mobNo" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">Password</label>
			<input type="password" required name="password" class="form-control">
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		</div>
	</div>
	</div>
	
	<div class="col-md-8">
	<div class="card card-paint">
		<div class="card-body">
		<p class="fs-3 text-center">Doctor Detail</p>
		<table class="table">
  <thead>
    <tr>
      <th scope="col">Fullname</th>
      <th scope="col">DOB</th>
      <th scope="col">Qualification</th>
      <th scope="col">Specialist</th>
      <th scope="col">Email</th>
      <th scope="col">Mob No</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
  List<Doctor> ls2 = dao2.getAllDoctor();
  for(Doctor d: ls2){
		%> 
		<tr>
	      <td><%=d.getFullname() %> </td>
	      <td><%=d.getDob() %> </td>
	      <td><%=d.getQualification() %> </td>
	      <td><%=d.getSpecialist() %> </td>
	      <td><%=d.getEmail() %> </td>
	      <td><%=d.getMobNo() %> </td>
	      <td>
	      <a href="edit_doctor.jsp?id=<%=d.getId() %> " class="btn btn-sm btn-primary">Edit</a>
	      <a href="../delete_doctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
	      </td>
	   </tr>
		<%
		}
	%>
    
  </tbody>
</table>
		</div>
	</div>
	</div>
</div>
</div>
</body>
</html>
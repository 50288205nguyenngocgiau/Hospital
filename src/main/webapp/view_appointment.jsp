<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
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
<c:if test="${empty userObj}">
	<c:redirect url="user_login.jsp"></c:redirect>
</c:if>
	
<%@include file="component/navbar.jsp" %>

<div class="container-fluid p-5 backImg">
<p class="text-center text-white fs-2"></p>
</div>

<div class="container p-3">
<div class="row">
<div class="col-md-9">
	<div class="card paint-card">
		<div class="card-body">
			<p class="text-center fs-4 text-success fw-bold">Appointment List</p>
			
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Fullname</th>
			      <th scope="col">Gender</th>
			      <th scope="col">Age</th>
			      <th scope="col">Appointment Date</th>
			      <th scope="col">Deseases</th>
			      <th scope="col">Doctor Name</th>
			      <th scope="col">Status</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%
			  User user = (User)session.getAttribute("userObj");
			  AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
			  List<Appointment> ls = dao.getAllAppointmentByLoginUser(user.getId());
			  
			  DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
			  
			  for(Appointment ap: ls){
				  Doctor doctor = dao2.getDoctorById(ap.getDoctorId());
				%>
				
				<tr>
			      <td><%=ap.getFullname() %> </td>
			      <td><%=ap.getGender() %> </td>
			      <td><%=ap.getAge() %> </td>
			      <td><%=ap.getAppointmentDate() %> </td>
			      <td><%=ap.getDeseases() %> </td>
			      <td><%=doctor.getFullname() %> </td>
			      <td>
			      <%
			      if("Pending".equals(ap.getStatus())){
			      %>
			      <a href="#" class="btn btn-sm btn-warning">Pending</a>
			      <%
			  	}else{
			      %> <%=ap.getStatus() %>
			      <%} %>
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

<div class="col-md-3 p-2">
	<img alt="" src="img/doc5.jpg">
</div>
</div>
</div>

</body>
</html>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="java.util.List"%>
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
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="col-md-12">
<div class="card paint-card">
<div class="card-body">
<p class="text-center fs-3">Patient Details</p>

<table class="table">
  <thead>
  <tr>
      <th scope="col">Fullname</th>
      <th scope="col">Gender</th>
      <th scope="col">Age</th>
      <th scope="col">Appointment Date</th>
      <th scope="col">Email</th>
      <th scope="col">Mob No</th>
      <th scope="col">Deseases</th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Address</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
  <%
  AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
  List<Appointment> lsAp = dao.getAllAppointment();
  DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
  
  for(Appointment ap: lsAp){
	  Doctor d = dao2.getDoctorById(ap.getDoctorId());
  %>
  
  <tr>
      <td><%=ap.getFullname() %> </td>
      <td><%=ap.getGender() %> </td>
      <td><%=ap.getAge() %> </td>
      <td><%=ap.getAppointmentDate() %> </td>
      <td><%=ap.getEmail() %> </td>
      <td><%=ap.getPhoneNo() %> </td>
      <td><%=ap.getDeseases() %> </td>
      <td><%=d.getFullname() %> </td>
      <td><%=ap.getAddress() %> </td>
      <td><%=ap.getStatus() %> </td>
    </tr>
  
  <%
  }
  %>
    
  </tbody>
</table>
</div>
</div>
</div>
</body>
</html>
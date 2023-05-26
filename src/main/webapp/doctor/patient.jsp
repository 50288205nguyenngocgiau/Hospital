<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
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

<div class="container p-3">
<div class="row">
	<div class="col-md-12">
	<div class="card paint-card">
		<div class="card-body">
		<p class="fs-3 text-center">Patient Details</p>
		
		<c:if test="${not empty errorMsg }">
			<p class="fs-4 text-center text-danger">${errorMsg }</p>
			<c:remove var="errorMsg" scope="session"></c:remove>
		</c:if>
		<c:if test="${not empty sucMsg }">
			<p class="fs-4 text-center text-success">${sucMsg }</p>
			<c:remove var="sucMsg" scope="session"/>
		</c:if>
		</div>
	</div>
	
	<table class="table">
  <thead>
    <tr>
      <th scope="col">Fullname</th>
      <th scope="col">Gender</th>
      <th scope="col">Age</th>
      <th scope="col">Appointment Date</th>
      <th scope="col">Email</th>
      <th scope="col">Phone No</th>
      <th scope="col">Deseases</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  Doctor d = (Doctor)session.getAttribute("docObj");
  AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
  List<Appointment> lsAp = dao.getAllAppointmentByDoctorLogin(d.getId());
  
  for(Appointment ap: lsAp){
	  
	  %>
	  
	  <tr>
      <th scope="row"><%=ap.getFullname() %> </th>
      <td><%=ap.getGender() %> </td>
      <td><%=ap.getAge() %> </td>
      <td><%=ap.getAppointmentDate() %> </td>
      <td><%=ap.getEmail() %> </td>
      <td><%=ap.getPhoneNo() %> </td>
      <td><%=ap.getDeseases() %> </td>
      <td><%=ap.getStatus() %> </td>
      <td>
      <%
      if("Pending".equals(ap.getStatus())){
    	  %>
    	  
    	  <a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-success btn-sm">
    	  <i class="fa-solid fa-comment"></i>
	      Comment
	      </a>
    	  <%
      }else{
    	  %>
    	  
    	  <a href="#" class="btn btn-success btn-sm disabled">
    	  <i class="fa-solid fa-comment"></i>
    		Comment
    		</a>
    	  <%
	      }
	      %>
      </td>
      <td></td>
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
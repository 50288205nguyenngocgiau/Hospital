<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<html>
<style>
.paint-card{
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3)
}
</style>

<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="component/allcss.jsp" %>
<body>
<%@include file="component/navbar.jsp" %>

<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/doc1.jpg" class="d-block w-100" alt="..." height="500" >
    </div>
    <div class="carousel-item">
      <img src="img/doc2.jpg" class="d-block w-100" alt="..." height="500">
    </div>
    <div class="carousel-item">
      <img src="img/doc3.jpg" class="d-block w-100" alt="..." height="500">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div class="container p-3">
<p class="tex-center fs-2">Key Features of our Hospital</p>

<div class="row">
	<div class="col-md-8 p-5">
	<div class="row">
	<div class="col-md-6">
		<div class="card paint-card">
			<div class="card-body">
			<p class="fs-5">100% Safety</p>
			<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum voluptas similique explicabo excepturi maxime nam iste aspernatur dolorum id culpa, quia nihil quo illum. Quod corporis cumque quisquam explicabo odit? </p>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="card paint-card">
			<div class="card-body">
			<p class="fs-5">Clean Environment</p>
			<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum voluptas similique explicabo excepturi maxime nam iste aspernatur dolorum id culpa, quia nihil quo illum. Quod corporis cumque quisquam explicabo odit? </p>
			</div>
		</div>
	</div>
	<div class="col-md-6 mt-2">
		<div class="card paint-card">
			<div class="card-body">
			<p class="fs-5">Friendly Doctors</p>
			<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum voluptas similique explicabo excepturi maxime nam iste aspernatur dolorum id culpa, quia nihil quo illum. Quod corporis cumque quisquam explicabo odit? </p>
			</div>
		</div>
	</div>
	<div class="col-md-6 mt-2">
		<div class="card paint-card">
			<div class="card-body">
			<p class="fs-5">Medical Research</p>
			<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum voluptas similique explicabo excepturi maxime nam iste aspernatur dolorum id culpa, quia nihil quo illum. Quod corporis cumque quisquam explicabo odit? </p>
			</div>
		</div>
	</div>
	</div>
	</div>
	<div class="col-md-4 p-5">
		<img alt="" src="img/doct.jpg">
	</div>
</div>
</div>

<div class="container p-2">
<p class="text-center fs-2">Our Team</p>

<div class="row">
	<div class="col-md-3">
	<div class="card paint-card">
		<div class="card-body text-center">
			<img src="img/doc1.jpg" width="250px" height="300px" >
			<p class="fw-bold fs-5">Smuani Simi</p>
			<p class="fs-7 ">(CEO & Chairman)</p>
		</div>
	</div>
	</div>
	<div class="col-md-3">
	<div class="card paint-card">
		<div class="card-body text-center">
			<img src="img/doc2.jpg" width="250px" height="300px" >
			<p class="fw-bold fs-5">Smuani & Suka</p>
			<p class="fs-7 ">(Chief Doctor)</p>
		</div>
	</div>
	</div>
	<div class="col-md-3">
	<div class="card paint-card">
		<div class="card-body text-center">
			<img src="img/doc3.jpg" width="250px" height="300px" >
			<p class="fw-bold fs-5">Devid</p>
			<p class="fs-7 ">(Chief Doctor)</p>
		</div>
	</div>
	</div>
	<div class="col-md-3">
	<div class="card paint-card">
		<div class="card-body text-center">
			<img src="img/doc4.jpg" width="250px" height="300px" >
			<p class="fw-bold fs-5">Chain</p>
			<p class="fs-7 ">(Chief Doctor)</p>
		</div>
	</div>
	</div>
</div>
</div>

<%@include file="component/footer.jsp" %>

</body>
</html>

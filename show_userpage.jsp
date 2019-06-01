<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<style>
.card-signin .card-body1 {
	padding: 2rem;
	height: 400px;
}

#padding1 {
	margin-top: 80px;
}

.col_pad {
	padding-left: 8px;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<link href="css/login.css" rel="stylesheet">
<link href="css/sticky-footer-navbar.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users data</title>
</head>
<body>
<header> <!-- Fixed navbar --> <nav
		class="navbar navbar-expand-md navbar-dark fixed-top bg-dark"> <a
		class="navbar-brand" href="/home">Project title</a>
		</nav></header>

	<c:if test="${not empty error}">
		<!-- <div class="alert alert-danger">-->
		<font color="red"> <c:out value="${error}"></c:out>
		</font>
	</c:if>
	<br />
	<div id="padding1"></div>
	<div class="d-flex justify-content-center align-items-center"">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-9 col-md-7 col-lg-10 mx-auto">
					<div class="card card-signin my-5">
						<div class="card-body1">
							
							<div style="float:left; margin-top:-15px">
								
									<b><h1>Users</h1></b>
							
							</div>
							<div style="float:right">
								
									<h4>
											<a href="/myhome4.0"><u><b>Show maps</b></u></a>
										</h4>
								
							</div>
						
							<form class="form-signin" style="margin-top:80px;">

								<div class="form-label-group">
									<table>
										<tr height="40">
											<td class="col_pad"><b>Id</b></td>
											<td class="col_pad"><b>Username</b></td>
											<td class="col_pad"><b>Password</b></td>
											<td class="col_pad"><b>Delete</b></td>
											<td class="col_pad"><b>Edit</b></td>
										</tr>

										<c:forEach var="user" items="${users}">
											<tr height="30">
												<td class="col_pad">${user.id}</td>
												<td class="col_pad">${user.username}</td>
												<td class="col_pad">${user.password}</td>
												<td class="col_pad"><a
													href="/delete-user?id=${user.id}"><u>Delete</u></a>
												<td class="col_pad"><a href="/edit-user?id=${user.id}"><u>Edit</u></a>
											</tr>
										</c:forEach>

									</table>
								</div>
								<br>


							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<footer class="footer">
      <div class="container">
        <span style="float:left">Contact: Chanakya Kumar(+91 989xxxxx48),
        Dharmesh Gusai(+91 766xxxxxx98)</span>
        <span style="float:right">Email: Chanakya Kumar(chanakya.ddu.ac.in),
        Dharmesh Gusai(dharmesh.ddu.ac.in)</span>
      </div>
    </footer>

	<!-- <br/>Username:<input type="text" name="username" value="${user.username}"/><br/>
Username:<input type="text" name="username" value="${user.username}"/><br/>
Password:<input type="password" name="password" value="${user.password}"/><br/>
<input type="submit" value="Login"/> -->

</body>


</html>

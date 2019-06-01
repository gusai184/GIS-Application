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
	margin-top: 30px;
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
<title>User Registration</title>
</head>
<body>


	<header> <!-- Fixed navbar --> <nav
		class="navbar navbar-expand-md navbar-dark fixed-top bg-dark"> <a
		class="navbar-brand" href="/home">Project title</a>
		
		
		
		<!-- 
			<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarCollapse" aria-controls="navbarCollapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>-->
	
	
	<!-- Logout
	
	
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav mr-auto">
			<!-- 
			
			<li class="nav-item active"><a class="nav-link" href="#">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
			
		</ul>
		<form class="form-inline mt-2 mt-md-0  navbar-right">
			
			<a
		class="navbar-brand" href="/login"><u>Logout</u></a>
			
			
		</form>
	</div>
	-->
	
	
	
	</nav> </header>



	<form method="post" action="register-user">
		<!-- <a href="/show-users">Show users</a>&nbsp;-->


		<c:if test="${not empty error}">
			<!-- <div class="alert alert-danger">-->
			<font color="red"> <c:out value="${error}"></c:out>
			</font>
		</c:if>
		<br />
		<div id="padding1"></div>
		<div class="d-flex justify-content-center align-items-center"">
			<div class="container">
				<div class="row">
					<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
						<div class="card card-signin my-5">
							<div class="card-body1">
								<h1 class="card-title text-center">
									<b><h1>Register</h1></b>
								</h1>
								<form class="form-signin">

									<div class="form-label-group">
									<!-- {user.X} refers to model class user in @ModelAttribute parameter of "register-user" mapping -->
										<input type="text" id="id" name="id" value="${user.id}"
											class="form-control" placeholder="Id" required autofocus>
										<label for="id">Id</label>
									</div>


									<div class="form-label-group">
										<input type="text" id="username" name="username"
											value="${user.username}" class="form-control"
											placeholder="Username" required autofocus> <label
											for="username">Username</label>
									</div>

									<div class="form-label-group">
										<input type="password" id="password" name="password"
											value="${user.password}" class="form-control"
											placeholder="Password" required> <label
											for="password">Password</label>
									</div>
									<br>


									<button class="btn btn-lg btn-primary btn-block text-uppercase"
										type="submit">Sign up</button>
									<br>
									<h1 class="card-title text-center">
										<b><h4>
												<a href="http://localhost:8888/final_GIS_APPLICATION/loginpage.jsp"><b><u>Login</u></b></a>
											</h4></b>
									</h1>

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

	</form>
</body>


</html>

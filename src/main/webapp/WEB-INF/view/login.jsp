<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	ServletContext context = request.getSession().getServletContext();
	String language = String.valueOf(context.getAttribute("language"));
%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.lebango.i18n.messages" />

<!DOCTYPE html>
<html lang="${language}">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Travel</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/font-awesome.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap-clockpicker.min.css" />">

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.slim.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/popper.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap-clockpicker.min.js" />"></script>

</head>

<body>
	<!-- 
	<div>
		<fmt:message key="login.title" />
	</div>
	 -->
	<div class="hader">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand" href="#"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto text-right">
						<li class="nav-item"><a class="nav-link" href="home">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="login">Login</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="login-2">
		<div class="container">
			<div class="row">
				<div class="full-width">
					<div class="col-md-6 col-sm-6 border-right-1">
						<center>
							<img src="<c:url value="/resources/img/logo.png" />" class="img-fluid">
						</center>
					</div>
					<div class="col-md-4 col-sm-4 ml-5">
						<c:url value="/loginchk" var="create" />
						<form:form modelAttribute="user" action="${create}" method="post"
							id="frmLogin">
							<form:errors cssClass="xxx" />
							<div class="login-box-2">
								<h4>Login</h4>
								<form:input type="text" path="email" class="form-control"
									placeholder="Enter Email Address" />
								<form:errors path="email" />
								<form:input type="password" path="password" class="form-control"
									placeholder="Password" />
								<form:errors path="password" />
								<a href="forgot-password" class="btn btn-link pull-right">Forgot
									Password</a>
								<div class="full-width text-right mt-3">
									<input type="submit" class="btn btn-primary btn-block"
										value="Login"> <a href="register"
										class="btn btn-primary btn-block">Creat an account</a>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<p>
						<a href="#">Home</a>
					</p>
					<p>
						<a href="#">Services</a>
					</p>
					<p>
						<a href="#">Testimonials</a>
					</p>
					<p>
						<a href="#">Successful Trip Stories</a>
					</p>
					<p>
						<a href="#">Best Service Providers</a>
					</p>
					<p>
						<a href="#">News</a>
					</p>
					<p>
						<a href="#">Account</a>
					</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
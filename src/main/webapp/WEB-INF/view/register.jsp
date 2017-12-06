<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
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

<script type="text/javascript">
	var getUrlParameter = function getUrlParameter(sParam) {
	    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	        sURLVariables = sPageURL.split('&'),
	        sParameterName,
	        i;
	
	    for (i = 0; i < sURLVariables.length; i++) {
	        sParameterName = sURLVariables[i].split('=');
	
	        if (sParameterName[0] === sParam) {
	            return sParameterName[1] === undefined ? true : sParameterName[1];
	        }
	    }
	};

	$(document).ready(function() {
		var message = decodeURIComponent(getUrlParameter('message'));
		var s = message.replace(/\+/g, ' ');
		if (message != null && message != 'undefined' ) {
			alert(s);
		}
		
		$('#next').click(function() {
			$('.set-sign-up').hide()
			$('.hide-box').show()
		});
	});
</script>
</head>
<body>
	<div class="hader">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand" href="index"> <img
					src="<c:url value="/resources/img/logo.png" />">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto text-right">
						<li class="nav-item"><a class="nav-link" href="index">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="login">Login</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="login">
		<div class="container">
			<div class="row">
				<div class="full-width">
					<div class="col-md-8 col-sm-8 ml-20  feild">
						<div class="set-sign-up">
						<script type="text/javascript">
							$(document).ready(function() {
								$('#nextone').click(function() {
									$account_type = $('input[name=user_type]:checked').val()
									if ($account_type == null) {
										alert("please select account type");
										return;
									}
									
									$account_group = $('input[name=user_group]:checked').val()
									if ($account_group == null) {
										alert("please select account group.");
										return;
									}
									
									$('#nav-profile-tab').addClass('active')
									$('#nav-profile').addClass('active')
									$('#nav-profile').addClass('show')
									$('#nav-home-tab').removeClass('active')
									$('#nav-home').removeClass('active')
									$('#nav-home').removeClass('show')
									$('#nav-contact-tab').removeClass('active')
									$('#nav-contact').removeClass('active')
									$('#nav-contact').removeClass('show')
								});
								
								$('#nexttwo').click(function() {
									
									$firstname = $('#firstname').val();
									if ($firstname == "") {
										alert("input first name.");
										return;
									}
									$lastname = $('#lastname').val();
									if ($lastname == "") {
										alert("input last name.");
										return;
									}
									$company_name = $('#company_name').val();
									if ($company_name == "") {
										alert("input company name.");
										return;
									}
									$phone = $('#phone').val();
									if ($phone == "") {
										alert("input mobile number.");
										return;
									}
									$email = $('#email').val();
									if ($email == "") {
										alert("input email.");
										return;
									}
									$repeat_email = $('#repeat_email').val();
									if ($repeat_email == "" || $repeat_email != $email) {
										alert("input correct email.");
										return;
									}
									$password = $('#password').val();
									if ($password == "" || $password.length < 6) {
										alert("input correct password. password is more than 6 characters");
										return;
									}
									$repeat_password = $('#repeat_password').val();
									if ($repeat_password == "" || $repeat_password != $password) {
										alert("input correct password.");
										return;
									}
									
									$('#nav-profile-tab').removeClass('active')
									$('#nav-profile').removeClass('active')
									$('#nav-profile').removeClass('show')
									$('#nav-home-tab').removeClass('active')
									$('#nav-home').removeClass('active')
									$('#nav-home').removeClass('show')
									$('#nav-contact-tab').addClass('active')
									$('#nav-contact').addClass('active')
									$('#nav-contact').addClass('show')
								});
								
								$('#finish').click(function() {
									if (!$('#agree_terms').is(':checked')) {
										alert("please check agree terms.");
										return;
									} 
									$( "#uploadForm" ).submit();
								});
							});
						</script>
							<nav class="nav nav-tabs" id="myTab" role="tablist">
								<a class="nav-item nav-link active" id="nav-home-tab"
									data-toggle="tab" role="tab" style="pointer-events: none; cursor: default;"
									aria-controls="nav-home" aria-selected="true">Setup 1</a> 
								<a
									class="nav-item nav-link" id="nav-profile-tab"
									data-toggle="tab" role="tab" style="pointer-events: none; cursor: default;"
									aria-controls="nav-profile" aria-selected="false">Setup 2</a> 
								<a
									class="nav-item nav-link" id="nav-contact-tab"
									data-toggle="tab" role="tab" style="pointer-events: none; cursor: default;"
									aria-controls="nav-contact" aria-selected="false">Setup 3</a>
							</nav>
							<form:form method="POST" action="register-user" modelAttribute="uploadForm" id="uploadForm" enctype="multipart/form-data">
							<div class="tab-content mt-5" id="nav-tabContent">
								
								<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
									<div class="full-width text-center">
										<h4 class="hadding">Account</h4>
									</div>
									<p class="mt-3">
										<strong>Choose a new account type</strong>
									</p>
									<p class="">
										<form:radiobutton path="user_type" name="user_type" id="agent" class="mt-3" value="1" />
										<form:label path="user_type">Agent</form:label>
									</p>
									<p class="full-width">You would like to book or reserve
										cars from our website for your travel group</p>
									<p>
										<!-- <input type="radio" name="user_type" id="supplier" class="mt-3" value="2"> -->
										<form:radiobutton path="user_type" name="user_type" id="supplier" class="mt-3" value="2" />  
										<form:label path="user_type">Supplier</form:label>
									</p>
									<p class="full-width">You would like to provide your car or guides on our website</p>
									<p>
										<br />
									<hr>
									</p>
									<p>
										<strong>And the new account is a</strong>
									</p>
									<p>
										<form:radiobutton path="user_group" name="user_group" id="person" class="mt-3" value="1" />  
										<form:label path="user_group">Personal Account</form:label>
									</p>
									<p>You are a Personal guide or a driver</p>
									<p>
										<form:radiobutton path="user_group" name="user_group" id="organization" class="mt-3" value="2" />
										<form:label path="user_group">Organization Account</form:label>
									</p>
									<p>You are a travel agent, cars suppler or guide supplier</p>
									<a href="#" class="btn btn-primary pull-right mt-3"
										id="nextone">Next</a>
								</div>

								<div class="tab-pane fade" id="nav-profile" role="tabpanel"
									aria-labelledby="nav-profile-tab">
									<div class="full-width text-center">
										<h4 class="hadding">Your Detail</h4>
									</div>
									<div class="full-width text-left mt-4">
										<div class="col-md-6 col-sm-6">
											<p>First Name</p>
											<form:input path="firstname" type="text" class="form-control"
												placeholder="First Name" name="firstname" id="firstname" />
										</div>
										<div class="col-md-6 col-sm-6">
											<p>Last Name</p>
											<form:input path="lastname" type="text" class="form-control"
												placeholder="Last Name" name="lastname" id="lastname" />
										</div>
									</div>
									<div class="full-width text-left mt-2">
										<div class="col-md-6 col-sm-6">
											<p>Company Name</p>
											<form:input path="company_name" type="text" class="form-control"
												placeholder="Company Name" name="company_name" id="company_name" />
										</div>
										<div class="col-md-6 col-sm-6">
											<p>Mobile Number</p>
											<form:input path="phone" type="text" class="form-control"
												placeholder="Mobile Number" name="phone" id="phone" />
											<!-- 
								            <div class="input-group">
								                  <div class="input-group-btn">
											        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											          +91
											        </button>
											        <div class="dropdown-menu">
											          <a class="dropdown-item" href="#">+91</a>
											          <a class="dropdown-item" href="#">+92</a>
											          <a class="dropdown-item" href="#">+966</a>										          
											        </div>
											      </div>
											      <input type="text" class="form-control" aria-label="Text input with dropdown button">
											</div>
										 	-->
										</div>
									</div>
									<div class="full-width text-left mt-2">
										<div class="col-md-6 col-sm-6">
											<p>Email Address</p>
											<form:input path="email" type="text" class="form-control"
												placeholder="Email Address" name="email" id="email" />
										</div>
										<div class="col-md-6 col-sm-6">
											<p>Repeat Email Address</p>
											<input type="text" class="form-control"
												placeholder="Repeat Email Address" name="repeat_email" id="repeat_email">
										</div>
									</div>
									<div class="full-width text-left mt-2">
										<div class="col-md-6 col-sm-6">
											<p>Password</p>
											<form:input path="password" type="password" class="form-control"
												placeholder="Password" name="password" id="password" />
										</div>
										<div class="col-md-6 col-sm-6">
											<p>Repeat password</p>
											<input type="password" class="form-control"
												placeholder="Repeat password" name="repeat_password" id="repeat_password">
										</div>
									</div>
									<div class="col-md-12 col-sm-12">
										<p>
											<br />
											<strong>Qualification Information</strong>
										</p>
									</div>
									<div class="full-width ">
										<div class="col-md-6 col-sm-6">
											<p class="mt-3">Business Register Certificate</p>
											<div class="panel panel-default">
												<input type="file" id="business_register_certificate" name="business_register_certificate" >
												<!-- 
												<div class="panel-body">
													<div class="input-group image-preview">
														<input placeholder=""
															class="form-control image-preview-filename" type="text">
														<div class="input-group-btn"> 
															<button type="button"
																class="btn btn-default image-preview-clear"
																style="display: none;">
																<span class="glyphicon glyphicon-remove"></span> Clear
															</button>
															<div class="btn btn-default image-preview-input">
																<span class="glyphicon glyphicon-folder-open"></span> <span
																	class="image-preview-input-title">Browse</span> <input
																	accept="image/png, image/jpeg, image/gif"
																	name="input-file-preview" type="file">
															</div>
														</div>
													</div>
												</div>
												-->
											</div>
										</div>
										<!-- 
										<div class="col-md-6 col-sm-6 text-right mt-5">
											<p class="green mt-2">
												<i class="fa fa-check-circle"></i> Uploud Successful
											</p>
										</div>
										 -->
									</div>
									<div class="full-width ">
										<div class="col-md-6 col-sm-6">
											<p class="mt-3">Car Service Company Certificate</p>
											<div class="panel panel-default">
												<input type="file" id="car_service_company_certificate" name="car_service_company_certificate" >
											</div>
										</div>
									</div>
									<div class="full-width ">
										<div class="col-md-6 col-sm-6">
											<p class="mt-3">Public Liability</p>
											<div class="panel panel-default">
												<input type="file" id="public_liability" name="public_liability" >
											</div>
										</div>
										
										<div class="full-width text-center">
											<a href="#" class="btn btn-primary pull-right mt-3" id="nexttwo">Next</a>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="nav-contact" role="tabpanel"
									aria-labelledby="nav-contact-tab">
									<div class="full-width text-center">
										<h4 class="hadding">Your Details</h4>
									</div>
									<div class="white-box-2 mt-4">
										<p>Lorem Ipsum is simply dummy text of the printing and
											typesetting industry. Lorem Ipsum has been the industry's
											standard dummy text ever since the 1500s, when an unknown
											printer took a galley of type and scrambled it to make a type
											specimen book. It has survived not only five centuries, but
											also the leap into electronic typesetting, remaining
											essentially unchanged. It was popularised in the 1960s with
											the release of Letraset sheets containing Lorem Ipsum
											passages, and more recently with desktop publishing software
											like Aldus PageMaker including versions of Lorem Ipsum.</p>
										<p>Lorem Ipsum is simply dummy text of the printing and
											typesetting industry. Lorem Ipsum has been the industry's
											standard dummy text ever since the 1500s, when an unknown
											printer took a galley of type and scrambled it to make a type
											specimen book. It has survived not only five centuries, but
											also the leap into electronic typesetting, remaining
											essentially unchanged. It was popularised in the 1960s with
											the release of Letraset sheets containing Lorem Ipsum
											passages, and more recently with desktop publishing software
											like Aldus PageMaker including versions of Lorem Ipsum.</p>
									</div>
									<p>
										<br />
										<strong>
										<input type="checkbox" id="agree_terms" name="agree_terms">
										<label for="done">I have read and agree <span>Terms</span> & <span>Conditions</span>
										</label>
										</strong>.
									</p>
									<div class="full-width text-right">
										<a href="#" class="btn btn-primary pull-right mt-3" id="finish">Finish</a>
									</div>
								</div>
								
							</div>
							</form:form>
						</div>
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
				<!-- 
				<div class="col-md-4 col-sm-4">
			      	<h4 class="sub-hadding-fotter">address</h4>
			      	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
			      	<h4 class="sub-hadding-fotter mt-3">news letter</h4>
			      	<div class="input-group">
				      <input type="text" class="form-control" placeholder="Enter Email address" aria-label="Search for...">
				      <span class="input-group-btn">
				        <button class="btn btn-primary" type="button"><i class="fa fa-paper-plane-o"></i></button>
				      </span>
				    </div>
			      </div>
			      <div class="col-md-3 col-sm-3">
			      	<h4 class="sub-hadding-fotter mb-2">map</h4>
			      	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d235526.9092472164!2d75.72376186016794!3d22.724228429850513!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3962fcad1b410ddb%3A0x96ec4da356240f4!2sIndore%2C+Madhya+Pradesh!5e0!3m2!1sen!2sin!4v1508505979264" width="100%" height="200" frameborder="0" style="border:0" allowfullscreen></iframe>
			      </div>
			      <div class="col-md-2 col-sm-2">
			        <center>
			        	<img src="img/fotter-logo.png" class="img-fluid mt-5">
			        </center>
			      </div>
			     -->
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>
</body>
</html>
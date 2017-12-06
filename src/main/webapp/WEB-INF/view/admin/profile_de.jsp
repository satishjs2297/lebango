<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Travel</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/font-awesome.min.css" />">	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-clockpicker.min.css" />">
	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.slim.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/popper.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />"></script>	
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap-clockpicker.min.js" />"></script>
	<script type="text/javascript">
    		$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
    </script>
</head>
<body>
	<div class="hader">
		<nav class="navbar navbar-expand-lg navbar-light fixed-hader">
			<div class="full-width">
				<a class="navbar-brand" href="#">
					<img src="<c:url value="/resources/admin/img/logo.png" />" class="mt-img">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse dashboard"
					id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto text-right ">
						<li class="nav-item"><a class="nav-link" href="account">Account</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Settings</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="home-page">
		<div class="container">
			<div class="row">
				<div class="accordion">
					<div class="full-width">
						<div class="col-md-8 col-sm-8 ml-20  feild">
							<div class="set-sign-up">
								<div class="full-width text-center">
									<h4 class="hadding">Your Detail</h4>
								</div>
								<div class="full-width text-left mt-4">
									<div class="col-md-6 col-sm-6">
										<p>First Name</p>
										<input type="text" class="form-control"
											placeholder="First Name" name="">
									</div>
									<div class="col-md-6 col-sm-6">
										<p>Last Name</p>
										<input type="text" class="form-control"
											placeholder="Last Name" name="">
									</div>
									<div class="col-md-6 col-sm-6 mt-2">
										<p>Mobile Number</p>
										<div class="input-group">
											<div class="input-group-btn">
												<button type="button"
													class="btn btn-primary dropdown-toggle"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">+91</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">+91</a> <a
														class="dropdown-item" href="#">+966</a> <a
														class="dropdown-item" href="#">+92</a>
												</div>
											</div>
											<input type="text" class="form-control"
												aria-label="Text input with dropdown button">
										</div>
									</div>
								</div>
								<div class="full-width text-left mt-2">
									<div class="col-md-6 col-sm-6">
										<p>Email Address</p>
										<input type="text" class="form-control"
											placeholder="Email Address" name="">
									</div>
									<div class="col-md-6 col-sm-6">
										<p>Repeat Email Address</p>
										<input type="text" class="form-control"
											placeholder="Repeat Email Address" name="">
									</div>
								</div>
								<div class="full-width text-left mt-2">
									<div class="col-md-6 col-sm-6">
										<p>Password</p>
										<input type="password" class="form-control"
											placeholder="Password" name="">
									</div>
									<div class="col-md-6 col-sm-6">
										<p>Repeat password</p>
										<input type="password" class="form-control"
											placeholder="Repeat password" name="">
									</div>
								</div>
								<div class="Col-md-12 col-sm-12">
									<p>
										<strong>Qualification Information</strong>
									</p>
								</div>

								<div class="full-width">
									<div class="col-md-6 col-sm-6">
										<p class="mt-3">File 1</p>
										<img src="<c:url value="/resources/img/file-uplod.png" />"
											class="img-fluid"> <a href="#"
											class="btn btn-secondary ">View</a>
									</div>
									<div class="col-md-6 col-sm-6">
										<p class="mt-3">File 2</p>
										<img src="<c:url value="/resources/img/file-uplod.png" />"
											class="img-fluid"> <a href="#"
											class="btn btn-secondary ">View</a>
									</div>
									<div class="full-width text-center">
										<a href="#" class="btn btn-primary pull-right mt-3"
											id="nexttwo">Done</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<ul class="left-menue">
		<li><a href="super-admin"><i class="fa fa-home"></i> Home <i
				class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="customer"><i class="fa fa-user"></i> Customers <i
				class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="service-provider"><i class="fa fa-users"></i>
				Service Providers<i class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="orders"><i class="fa fa-file-text"></i> Orders<i
				class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="widthdrawal-request"><i
				class="fa fa-hand-paper-o"></i> Withdraw Requests<i
				class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="register-request"><i class="fa fa-pencil"></i>
				Register Requests<i class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="news"><i class="fa fa-newspaper-o"></i> News<i
				class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="reviews"><i class="fa fa-undo"></i> Reviews<i
				class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="#"><i class="fa fa-database"></i> Database
				Backup<i class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="index"><i class="fa fa-sign-out"></i> Logout<i
				class="fa fa-angle-right pull-right"></i></a></li>
	</ul>

	<script type="text/javascript">
$('.clockpicker').clockpicker()
	.find('input').change(function(){
		console.log(this.value);
	});
var input = $('#single-input').clockpicker({
	placement: 'bottom',
	align: 'left',
	autoclose: true,
	'default': 'now'
});

$('.clockpicker-with-callbacks').clockpicker({
		donetext: 'Done',
		init: function() { 
			console.log("colorpicker initiated");
		},
		beforeShow: function() {
			console.log("before show");
		},
		afterShow: function() {
			console.log("after show");
		},
		beforeHide: function() {
			console.log("before hide");
		},
		afterHide: function() {
			console.log("after hide");
		},
		beforeHourSelect: function() {
			console.log("before hour selected");
		},
		afterHourSelect: function() {
			console.log("after hour selected");
		},
		beforeDone: function() {
			console.log("before done");
		},
		afterDone: function() {
			console.log("after done");
		}
	})
	.find('input').change(function(){
		console.log(this.value);
	});

// Manually toggle to the minutes view
$('#check-minutes').click(function(e){
	// Have to stop propagation here
	e.stopPropagation();
	input.clockpicker('show')
			.clockpicker('toggleView', 'minutes');
});
if (/mobile/i.test(navigator.userAgent)) {
	$('input').prop('readOnly', true);
}
</script>
</body>
</html>
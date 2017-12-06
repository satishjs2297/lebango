<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Travel</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/admin/css/bootstrap.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/admin/css/style.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/admin/css/font-awesome.min.css" />">	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/admin/css/bootstrap-clockpicker.min.css" />">
	<script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>	
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
		  <a class="navbar-brand" href="#"><img src="img/logo.png" class="mt-img"></a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>

		  <div class="collapse navbar-collapse dashboard" id="navbarSupportedContent">
		   <ul class="navbar-nav mr-auto text-right ">
			      <li class="nav-item">
			        <a class="nav-link" href="account">Account</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Settings</a>
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
            <div class="col-md-4 col-sm-4">
             <div class="row">
              <h4>Search News</h4>
              <div class="input-group">
				      <input type="text" class="form-control" placeholder="Search for..." aria-label="Search for...">
				      <span class="input-group-btn">
				        <a href="#" class="btn btn-secondary" type="button"><i class="fa fa-search"></i></a>
				      </span>
			  </div>
              </div>
            </div>
          </div>

          <div class="full-width mt-3">
            <div class="col-md-4 col-sm-4">
              <div class="box-border">
                 <img src="img/user-iamge.png" class="img-fluid">
                 <h5 class="mt-3">User Name</h5>
                 <p>Rating: 4.5 Star</p>
                 <p><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i></p>
              </div>
            </div>
            <div class="col-md-4 col-sm-4">
              <div class="box-border">
                 <img src="img/user-iamge.png" class="img-fluid">
                 <h5 class="mt-3">User Name</h5>
                 <p>Rating: 4.5 Star</p>
                 <p><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i></p>
              </div>
            </div>
            <div class="col-md-4 col-sm-4">
              <div class="box-border">
                 <img src="img/user-iamge.png" class="img-fluid">
                 <h5 class="mt-3">User Name</h5>
                 <p>Rating: 4.5 Star</p>
                 <p><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-o"></i></p>
              </div>
            </div>
          </div>
            
    </div>
  </div>
</div>
</div>

<ul class="left-menue">
	<li><a href="super-admin"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="customer"><i class="fa fa-user"></i> Customers <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="service-provider"><i class="fa fa-users"></i> Service Providers<i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="orders"><i class="fa fa-file-text"></i> Orders<i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="widthdrawal-request"><i class="fa fa-hand-paper-o"></i> Withdraw Requests<i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="register-request"><i class="fa fa-pencil"></i> Register Requests<i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="news"><i class="fa fa-newspaper-o"></i> News<i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="reviews"><i class="fa fa-undo"></i> Reviews<i class="fa fa-angle-right pull-right"></i></a></li>	
	<li><a href="#"><i class="fa fa-database"></i> Database Backup<i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="index"><i class="fa fa-sign-out"></i> Logout<i class="fa fa-angle-right pull-right"></i></a></li>
</ul>



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/bootstrap-clockpicker.min.js"></script>
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
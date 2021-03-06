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
    <script type="text/javascript" src="js/dopdown.js"></script>
</head>
<body>
	<div class="hader">
	  <nav class="navbar navbar-expand-lg navbar-light fixed-hader">
	   <div class="full-width">
		  <a class="navbar-brand" href="#"><img src="<c:url value="/resources/img/logo.png" />" class="mt-img"></a>
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
            <div class="border-box-2">
               <h4><strong>Edit Guide Information</strong></h4>
                <div class="full-width mt-3">
				      <div class="col-20">
				        <div class="img-uplod">
				           <img src="img/user-iamge.png" class="img-fluid">
				        </div>
				      </div>
				      <div class="col-20">
				        <div class="img-uplod">
				          <a href="#"><i class="fa fa-plus"></i></a>
				        </div>
				      </div>
				   </div>
               <div class="full-width mt-2">
	               <div class="col-md-4 col-sm-4">
	               <p>Name</p>
	               <input type="text" class="form-control" placeholder="First Name" name="">
	               </div>
	               <div class="col-md-4 col-sm-4">
	               <p>Sex</p>
	                <select class="form-control">
	                	<option>Male</option>
	                	<option>Female</option>
	                </select>
	               </div>
	               <div class="col-md-4 col-sm-4">
	               <p>Car List</p>
	               <div class="multiselect">
			            <div class="selectBox" onclick="showCheckboxes0()">
			              <select class="form-control">
			                <option>Car Type</option>
			              </select>
			              <div class="overSelect"></div>
			            </div>
			            <div id="checkboxes0">
			              <label for="one">
			                <input type="checkbox" id="one">
			                Demo</label>
			              <label for="two">
			                <input type="checkbox" id="two">
			                Demo</label>
			              <label for="three">
			                <input type="checkbox" id="three">
			                Demo</label>
			              <label for="for">
			                <input type="checkbox" id="for">
			                Demo</label>
			              <label for="five">
			                <input type="checkbox" id="five">
			                Demo</label>
			              <label for="six">
			                <input type="checkbox" id="six">
			                Demo</label>
			              <label for="seven">
			                <input type="checkbox" id="seven">
			                Skirts</label>
			              <label for="eight">
			                <input type="checkbox" id="eight">
			                Demo</label>
			              <label for="nine">
			                <input type="checkbox" id="nine">
			                Demo</label>
			            </div>
			          </div>
	               </div>
	               <div class="col-md-4 col-sm-4">
	                <p>Age</p>
	                <input type="text" class="form-control" placeholder="Age" name="">
	               </div>
               </div>
               <div class="col-md-12 col-sm-12">
                 <a href="#" class="btn btn-primary">Save</a>
                 <a href="#" class="btn btn-danger">Cancell</a>
               </div>
            </div>
        </div>
    </div>
  </div>
</div>

<ul class="left-menue">
	<li><a href="home"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="add-car"><i class="fa fa-car"></i> Add Cars <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="manage-car"><i class="fa fa-sliders"></i> Manage Cars <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="add-guide"><i class="fa fa-user"></i> Add Guide <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="manage-guide"><i class="fa fa-sliders"></i> Manage Guide <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="transactions"><i class="fa fa-credit-card-alt"></i> Transactions <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="locations"><i class="fa fa-hand-paper-o"></i> Manage Location <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="/logout"><i class="fa fa-sign-out"></i> Log Out <i class="fa fa-angle-right pull-right"></i></a></li>	
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
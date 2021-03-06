<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Travel</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/font-awesome.min.css" />">	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-clockpicker.min.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery-ui.css" />">
	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.js" />"></script>
	<!-- <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.slim.js" />"></script> -->
	<script type="text/javascript" src="<c:url value="/resources/js/popper.min.js" />"></script> 
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />"></script>	
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap-clockpicker.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/dopdown.js" />"></script>	
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
		  <a class="navbar-brand" href="#"><img src="<c:url value="/resources/img/logo.png" />" class="mt-img"></a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>

		  <div class="collapse navbar-collapse dashboard" id="navbarSupportedContent">
		   <ul class="navbar-nav mr-auto text-right ">
			      <li class="nav-item">
			        <a class="nav-link" href="account.html">Account</a>
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
            <div class="full-width mt-3">
			          <div class="full-width">
			            <div class="col-md-4 col-sm-4">
			             <div class="row">
			              <h4>Search orders</h4>
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
			            <div class="table">
			            	<table>
			            		<tr>
			            			<th>User Name</th>
			            			<th>Service Provider</th>
			            			<th>Order Detial</th>
			            			<th>Status</th>
			            		</tr>
			            		<tr>
			            			<td>Demo</td>
			            			<td>Demo</td>
			            			<td>Tarvel</td>
			            			<td><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Delet"> <i class="fa fa-trash-o"></i></a></td>
			            		</tr>
			            		<tr>
			            			<td>Demo</td>
			            			<td>Demo</td>
			            			<td>Tarvel</td>
			            			<td><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Delet"> <i class="fa fa-trash-o"></i></a></td>
			            		</tr>
			            		<tr>
			            			<td>Demo</td>
			            			<td>Demo</td>
			            			<td>Tarvel</td>
			            			<td><a href="#" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Delet"> <i class="fa fa-trash-o"></i></a></td>
			            		</tr>
			            	</table>
			            </div>
			          </div>     
            </div>
    </div>
  </div>
</div>
</div>

<ul class="left-menue">
	<li><a href="home"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="agents"><i class="fa fa-user"></i> Agents <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="suppliers"><i class="fa fa-users"></i> Suppliers <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="orders"><i class="fa fa-file-text"></i> Orders<i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="transactions"><i class="fa fa-hand-paper-o"></i> Transactions <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="register-request"><i class="fa fa-pencil"></i> Register Requests<i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="#"><i class="fa fa-database"></i> Database Backup<i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="/logout"><i class="fa fa-sign-out"></i> Logout<i class="fa fa-angle-right pull-right"></i></a></li>
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
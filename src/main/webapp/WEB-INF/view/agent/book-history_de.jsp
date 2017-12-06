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
		
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/font-awesome.min.css" />'><link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-clockpicker.min.css" />">
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
					<div class="full-width mt-3">
						<div class="full-width">
							<div class="col-md-4 col-sm-4">
								<div class="row">
									<h4>Search Order</h4>
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="Search for..." aria-label="Search for...">
										<span class="input-group-btn"> <a href="#"
											class="btn btn-secondary" type="button"><i
												class="fa fa-search"></i></a>
										</span>
									</div>
								</div>
							</div>
						</div>

						<div class="full-width table mt-3">
							<table>
								<tr>
									<th>No</th>
									<th>Tour Code</th>
									<th>Location</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th>Total Amount</th>
									<th>Invoice Date</th>
									<th>Payment Status</th>
									<th>Contact Person</th>
									<th>Feedback</th>
									<th>Order Date</th>
									<th>Status</th>
								</tr>
								<tr>
									<td>1</td>
									<td>201DE2</td>
									<td>New South Tempton</td>
									<td>2017-12-11 09:15</td>
									<td>2017-12-20 19:15</td>
									<td>$125.90</td>
									<td>2017-11-05 04:15</td>
									<td>Not paid</td>
									<td>Terry, Phone: +1 148 3093 4883</td>
									<td>Leave</td>
									<td>2017-11-05 04:15</td>
									<td>Accepting Order</td>
									<!-- 
			            			<td><a href="edit" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Delet"> <i class="fa fa-trash-o"></i></a></td>
			            		 -->
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<ul class="left-menue">
		<li><a href="myorder"><i class="fa fa-file-text-o"></i>
				Booking History <i class="fa fa-angle-right pull-right"></i></a></li>
		<li><a href="booktrip"><i class="fa fa-bookmark"></i> New
				Booking <i class="fa fa-angle-right pull-right"></i></a></li>
	</ul>

	<script type="text/javascript">
		$('.clockpicker').clockpicker().find('input').change(function() {
			console.log(this.value);
		});
		var input = $('#single-input').clockpicker({
			placement : 'bottom',
			align : 'left',
			autoclose : true,
			'default' : 'now'
		});
	
		$('.clockpicker-with-callbacks').clockpicker({
			donetext : 'Done',
			init : function() {
				console.log("colorpicker initiated");
			},
			beforeShow : function() {
				console.log("before show");
			},
			afterShow : function() {
				console.log("after show");
			},
			beforeHide : function() {
				console.log("before hide");
			},
			afterHide : function() {
				console.log("after hide");
			},
			beforeHourSelect : function() {
				console.log("before hour selected");
			},
			afterHourSelect : function() {
				console.log("after hour selected");
			},
			beforeDone : function() {
				console.log("before done");
			},
			afterDone : function() {
				console.log("after done");
			}
		}).find('input').change(function() {
			console.log(this.value);
		});
	
		// Manually toggle to the minutes view
		$('#check-minutes').click(function(e) {
			// Have to stop propagation here
			e.stopPropagation();
			input.clockpicker('show').clockpicker('toggleView', 'minutes');
		});
		if (/mobile/i.test(navigator.userAgent)) {
			$('input').prop('readOnly', true);
		}
	</script>
</body>
</html>
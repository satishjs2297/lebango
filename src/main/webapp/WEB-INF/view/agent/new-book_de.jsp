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
<script type="text/javascript">
    $(document).ready(function(){
		$('#nextone').click(function(){
			$('#nav-profile-tab').addClass('active')
			$('#nav-profile').addClass('active')
			$('#nav-profile').addClass('show')
			$('#nav-home-tab').removeClass('active')
			$('#nav-home').removeClass('active')
			$('#nav-home').removeClass('show')
			$('#nav-contact-tab').removeClass('active')
			$('#nav-contact').removeClass('active')
			$('#nav-contact').removeClass('show')
			$('#nav-done-tab').removeClass('active')
			$('#nav-done').removeClass('active')
			$('#nav-done').removeClass('show')
		});
		$('#nexttwo').click(function(){
			$('#nav-profile-tab').removeClass('active')
			$('#nav-profile').removeClass('active')
			$('#nav-profile').removeClass('show')
			$('#nav-home-tab').removeClass('active')
			$('#nav-home').removeClass('active')
			$('#nav-home').removeClass('show')
			$('#nav-contact-tab').addClass('active')
			$('#nav-contact').addClass('active')
			$('#nav-contact').addClass('show')
			$('#nav-done-tab').removeClass('active')
			$('#nav-done').removeClass('active')
			$('#nav-done').removeClass('show')
		});
		$('#pre').click(function(){
			$('#nav-profile-tab').removeClass('active')
			$('#nav-profile').removeClass('active')
			$('#nav-profile').removeClass('show')
			$('#nav-home-tab').addClass('active')
			$('#nav-home').addClass('active')
			$('#nav-home').addClass('show')
			$('#nav-contact-tab').removeClass('active')
			$('#nav-contact').removeClass('active')
			$('#nav-contact').removeClass('show')
			$('#nav-done-tab').removeClass('active')
			$('#nav-done').removeClass('active')
			$('#nav-done').removeClass('show')
		});
		$('#nextthree').click(function(){
			$('#nav-profile-tab').removeClass('active')
			$('#nav-profile').removeClass('active')
			$('#nav-profile').removeClass('show')
			$('#nav-done-tab').addClass('active')
			$('#nav-done').addClass('active')
			$('#nav-done').addClass('show')
			$('#nav-contact-tab').removeClass('active')
			$('#nav-contact').removeClass('active')
			$('#nav-contact').removeClass('show')
			$('#nav-home-tab').removeClass('active')
			$('#nav-home').removeClass('active')
			$('#nav-home').removeClass('show')
		});
		$('#pretwo').click(function(){
			$('#nav-profile-tab').addClass('active')
			$('#nav-profile').addClass('active')
			$('#nav-profile').addClass('show')
			$('#nav-done-tab').removeClass('active')
			$('#nav-done').removeClass('active')
			$('#nav-done').removeClass('show')
			$('#nav-contact-tab').removeClass('active')
			$('#nav-contact').removeClass('active')
			$('#nav-contact').removeClass('show')
			$('#nav-home-tab').removeClass('active')
			$('#nav-home').removeClass('active')
			$('#nav-home').removeClass('show')
		});
		$('#prethree').click(function(){
			$('#nav-profile-tab').removeClass('active')
			$('#nav-profile').removeClass('active')
			$('#nav-profile').removeClass('show')
			$('#nav-done-tab').removeClass('active')
			$('#nav-done').removeClass('active')
			$('#nav-done').removeClass('show')
			$('#nav-contact-tab').addClass('active')
			$('#nav-contact').addClass('active')
			$('#nav-contact').addClass('show')
			$('#nav-home-tab').removeClass('active')
			$('#nav-home').removeClass('active')
			$('#nav-home').removeClass('show')
		});
	});
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
            <div class="col-md-12 col-sm-12   feild">
	        	  <div class="set-sign-up">
	        	  
	        	   <nav class="nav nav-tabs" id="myTab" role="tablist">
					  <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true"><span class="number-circel">1</span> Setup </a>
					  <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false"><span class="number-circel">2</span> Setup </a>
					  <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false"><span class="number-circel">3</span> Setup </a>
					   <a class="nav-item nav-link" id="nav-done-tab" data-toggle="tab" href="#nav-done" role="tab" aria-controls="nav-done" aria-selected="false"><span class="number-circel">4</span> Setup </a>
					</nav>
					<div class="tab-content mt-5" id="nav-tabContent">
					  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					      <div class="full-width">
						      	<div class="col-md-6 col-sm-6">
						      	   <h4>Start Date</h4>
						      	   <input type="text" id="datepicker" class="form-control" placeholder="Start Date">
						      	     <div class="col-md-6 col-sm-6">
						      	     <div class="row">
						      	     <select class="form-control set-option">
							      	     	<option>Select Time</option>
							      	     	<option>2:55 PM</option>
							      	     	<option>3:55 PM</option>
							      	     	<option>4:55 PM</option>
							      	     </select>
							      	 </div>
							      	 </div>    
						      	     <script>
										  $( function() {
										    $( "#datepicker" ).datepicker();
										  } );
									 </script>
						      	  </div>
						      	<div class="col-md-6 col-sm-6">
							      	    <h4>End Date</h4>
							      	     <input type="text" id="datepickertwo" class="form-control" placeholder="End Date">
							      	     <div class="col-md-6 col-sm-6">
						      	     <div class="row">
						      	     <select class="form-control set-option">
							      	     	<option>Select Time</option>
							      	     	<option>2:55 PM</option>
							      	     	<option>3:55 PM</option>
							      	     	<option>4:55 PM</option>
							      	     </select>
							      	 </div>
							      	 </div> 
						      	     <script>
										  $( function() {
										    $( "#datepickertwo" ).datepicker();
										  } );
									 </script>
						      	</div>
					      </div>
					      <div class="full-width mt-4">
						      	<div class="col-md-6 col-sm-6">
						      	          <h4>Pickup Location</h4>
										    <select class="form-control">
										    	<option>Select Location</option>
										    	<option>Demo </option>
										    </select>
						      	</div>						      	
						      	<div class="col-md-6 col-sm-6">
							      	      <h4>Drop Location</h4>
										   <select class="form-control">
										    	<option>Select Location</option>
										    	<option>Demo</option>
										    </select>
						      	</div>
						      	</div>
					      

					      <div class="full-width mt-5">
						        <div class="col-md-3 col-sm-3">
						                        <h4>Day 1 Trip</h4>
											   <select class="form-control">
											  	<option>Demo</option>
											  </select>
						        </div>
						        <div class="col-md-3 col-sm-3">
						                        <h4>Day 2 Trip</h4>
											   <select class="form-control">
											  	<option>Demo</option>
											  </select>
						        </div>
						        <div class="col-md-3 col-sm-3">
						                        <h4>Day 3 Trip</h4>
											   <select class="form-control">
											  	<option>Demo</option>
											  </select>
						        </div>
						        <div class="col-md-3 col-sm-3">
						                        <h4>Day 4 Trip</h4>
											   <select class="form-control">
											  	<option>Demo</option>
											  </select>
						        </div>
						        <a href="#" class="btn btn-primary pull-right mt-3" id="nextone">Next</a>
					      </div>

					  </div>
					  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					     <div class="full-width">
						       <div class="col-md-2 col-sm-2 mt-4">
						          <h4 class="hadding ">Search</h4>
						       </div>
						       <div class="col-md-5 col-sm-5">
						         <h4>Seats</h4>
						         <select class="form-control">
						         	<option>1</option>
						         	<option>2</option>
						         	<option>3</option>
						         	<option>4</option>
						         	<option>5</option>
						         	<option>6</option>
						         </select>
						       </div>
						        <div class="col-md-5 col-sm-5 ">
						         <h4>Sort By</h4>
						         <select class="form-control">
						         	<option>Rate</option>
						         	<option>Rating</option>
						         </select>
						       </div>
					     </div>
					     <div class="full-width mt-4">
					       <div class="veichel-box">
					       	  <div class="col-md-3 col-sm-3">
					       	    <div class="row">
					       	    <div class="veichel-img">
					       	   		<img src="<c:url value="/resources/img/car.png" />" class="img-fluid">
					       	    </div>
					       	    </div>
					       	  </div>
					       	  <div class="col-md-6 col-sm-6">
					       	    <p><strong>Cars Detail :</strong> Toyta Camry,2012,5 Seats</p>
					       	    <p><strong>Car Location :</strong> Brisbane,4001</p>
					       	    <p><strong>Price :</strong> $300/day</p>
					       	    <p><strong>Guide :</strong> Haan <span><a href="#" class="">Change</a></span></p>
					       	  </div>
					       	  <div class="col-md-3 col-sm-3">
					       	    <a href="#" class="btn btn-primary btn-block mt-4">Add</a>
					       	  </div>
					       </div>

					       <div class="veichel-box mt-2" >
					       	  <div class="col-md-3 col-sm-3">
					       	    <div class="row">
					       	    <div class="veichel-img">
					       	    		<img src="<c:url value="/resources/img/car.png" />" class="img-fluid">
					       	    </div>
					       	    </div>
					       	  </div>
					       	  <div class="col-md-6 col-sm-6">
					       	    <p><strong>Cars Detail :</strong> Toyta Camry,2012,5 Seats</p>
					       	    <p><strong>Car Location :</strong> Brisbane,4001</p>
					       	    <p><strong>Price :</strong> $300/day</p>
					       	    <p><strong>Guide :</strong> Haan <span><a href="#" class="">Change</a></span></p>
					       	  </div>
					       	  <div class="col-md-3 col-sm-3">
					       	    <a href="#" class="btn btn-primary btn-block mt-4">Add</a>
					       	  </div>
					       </div>


					       <div class="veichel-box mt-2">
					       	  <div class="col-md-3 col-sm-3">
					       	    <div class="row">
					       	    <div class="veichel-img">
					       	    	<img src="<c:url value="/resources/img/car.png" />" class="img-fluid">
					       	    </div>
					       	    </div>
					       	  </div>
					       	  <div class="col-md-6 col-sm-6">
					       	    <p><strong>Cars Detail :</strong> Toyta Camry,2012,5 Seats</p>
					       	    <p><strong>Car Location :</strong> Brisbane,4001</p>
					       	    <p><strong>Price :</strong> $300/day</p>
					       	    <p><strong>Guide :</strong> Haan <span><a href="#" class="">Change</a></span></p>
					       	  </div>
					       	  <div class="col-md-3 col-sm-3">
					       	    <a href="#" class="btn btn-primary btn-block mt-4">Add</a>
					       	  </div>
					       </div>

					       <div class="veichel-box mt-2">
					       	  <div class="col-md-3 col-sm-3">
					       	    <div class="row">
					       	    <div class="veichel-img">
					       	    	<img src="<c:url value="/resources/img/car.png" />" class="img-fluid">
					       	    </div>
					       	    </div>
					       	  </div>
					       	  <div class="col-md-6 col-sm-6">
					       	    <p><strong>Cars Detail :</strong> Toyta Camry,2012,5 Seats</p>
					       	    <p><strong>Car Location :</strong> Brisbane,4001</p>
					       	    <p><strong>Price :</strong> $300/day</p>
					       	    <p><strong>Guide :</strong> Haan <span><a href="#" class="">Change</a></span></p>
					       	  </div>
					       	  <div class="col-md-3 col-sm-3">
					       	    <a href="#" class="btn btn-primary btn-block mt-4">Add</a>
					       	  </div>

					       </div>
					       <a href="#" class="btn btn-primary pull-right mt-3" id="nexttwo">Next</a>
					       <a href="#" class="btn btn-primary pull-left mt-3" id="pre">Previews</a>
					     </div>

					  </div>
					  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
					    <div class="full-width text-center">
					    	<h4 class="hadding">Traveller Information File</h4>
					    </div>
					    <div class="full-width ">
						      <div class="col-md-6 col-sm-6">
						            <h4 class="mt-3"><strong>Upload File 1</strong></h4>
						        	<div class="panel panel-default">
										
										<div class="panel-body">
											<div class="input-group image-preview">
												<input placeholder="" type="text" class="form-control image-preview-filename">
												<!-- don't give a name === doesn't send on POST/GET --> 
												<span class="input-group-btn"> 
												<!-- image-preview-clear button -->
												<button type="button" class="btn btn-default image-preview-clear" style="display:none;"> <span class="glyphicon glyphicon-remove"></span> Clear </button>
												<!-- image-preview-input -->
												<div class="btn btn-default image-preview-input"> <span class="glyphicon glyphicon-folder-open"></span> <span class="image-preview-input-title">Browse</span>
													<input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/>
													<!-- rename it --> 
												</div>
												</span> </div>
										</div>
									</div>
						      </div>
						      <div class="col-md-6 col-sm-6 text-right">
						         <p class="green mt-5"><i class="fa fa-check-circle"></i> Uploud Successful</p>
						      </div>
					    </div>
					    <div class="full-width">
						      <div class="col-md-6 col-sm-6">
						            <h4 class="mt-3"><strong>Upload File 2</strong></h4>
						        	<div class="panel panel-default">
										
										<div class="panel-body">
											<div class="input-group image-preview">
												<input placeholder="" type="text" class="form-control image-preview-filename">
												<!-- don't give a name === doesn't send on POST/GET --> 
												<span class="input-group-btn"> 
												<!-- image-preview-clear button -->
												<button type="button" class="btn btn-default image-preview-clear" style="display:none;"> <span class="glyphicon glyphicon-remove"></span> Clear </button>
												<!-- image-preview-input -->
												<div class="btn btn-default image-preview-input"> <span class="glyphicon glyphicon-folder-open"></span> <span class="image-preview-input-title">Browse</span>
													<input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/>
													<!-- rename it --> 
												</div>
												</span> </div>
										</div>
									</div>
						      </div>
						      <div class="col-md-6 col-sm-6 text-right">
						         <p class="green mt-5"><i class="fa fa-check-circle"></i> Uploud Successful</p>
						      </div>
					    </div>

					    <div class="full-width">
						      <div class="col-md-6 col-sm-6">
						            <h4 class="mt-3"><strong>Upload File 3</strong></h4>
						        	<div class="panel panel-default">
										
										<div class="panel-body">
											<div class="input-group image-preview">
												<input placeholder="" type="text" class="form-control image-preview-filename">
												<!-- don't give a name === doesn't send on POST/GET --> 
												<span class="input-group-btn"> 
												<!-- image-preview-clear button -->
												<button type="button" class="btn btn-default image-preview-clear" style="display:none;"> <span class="glyphicon glyphicon-remove"></span> Clear </button>
												<!-- image-preview-input -->
												<div class="btn btn-default image-preview-input"> <span class="glyphicon glyphicon-folder-open"></span> <span class="image-preview-input-title">Browse</span>
													<input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/>
													<!-- rename it --> 
												</div>
												</span> </div>
										</div>
									</div>
						      </div>
						      <div class="col-md-6 col-sm-6 text-right">
						         <p class="green mt-5"><i class="fa fa-check-circle"></i> Uploud Successful</p>
						      </div>
					    </div>

					    <div class="full-width">
						      <div class="col-md-6 col-sm-6">
						            <h4 class="mt-3"><strong>Upload File 4</strong></h4>
						        	<div class="panel panel-default">
										
										<div class="panel-body">
											<div class="input-group image-preview">
												<input placeholder="" type="text" class="form-control image-preview-filename">
												<!-- don't give a name === doesn't send on POST/GET --> 
												<span class="input-group-btn"> 
												<!-- image-preview-clear button -->
												<button type="button" class="btn btn-default image-preview-clear" style="display:none;"> <span class="glyphicon glyphicon-remove"></span> Clear </button>
												<!-- image-preview-input -->
												<div class="btn btn-default image-preview-input"> <span class="glyphicon glyphicon-folder-open"></span> <span class="image-preview-input-title">Browse</span>
													<input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/>
													<!-- rename it --> 
												</div>
												</span> </div>
										</div>
									</div>
						      </div>
						      <div class="col-md-6 col-sm-6 text-right">
						         <p class="green mt-5"><i class="fa fa-check-circle"></i> Uploud Successful</p>
						      </div>
					    </div>

					    <div class="full-width">
						      <div class="col-md-6 col-sm-6">
						            <h4 class="mt-3"><strong>Upload File 5</strong></h4>
						        	<div class="panel panel-default">
										
										<div class="panel-body">
											<div class="input-group image-preview">
												<input placeholder="" type="text" class="form-control image-preview-filename">
												<!-- don't give a name === doesn't send on POST/GET --> 
												<span class="input-group-btn"> 
												<!-- image-preview-clear button -->
												<button type="button" class="btn btn-default image-preview-clear" style="display:none;"> <span class="glyphicon glyphicon-remove"></span> Clear </button>
												<!-- image-preview-input -->
												<div class="btn btn-default image-preview-input"> <span class="glyphicon glyphicon-folder-open"></span> <span class="image-preview-input-title">Browse</span>
													<input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/>
													<!-- rename it --> 
												</div>
												</span> </div>
										</div>
									</div>
						      </div>
						      <div class="col-md-6 col-sm-6 text-right">
						         <p class="red mt-5"><i class="fa fa-times-circle"></i> Uploud Cancell</p>
						      </div>
					    </div>

					     <div class="full-width text-center mt-3">
					    	<h4 class="hadding">Fruther Option</h4>
					    </div>
					    <div class="full-width mt-4">
						      <div class="col-md-12 col-sm-12">
							      	<textarea class="form-control" placeholder="Fruther option" rows="4"></textarea>
						      </div>
						      <a href="#" class="btn btn-primary pull-right mt-3" id="nextthree">Next</a>
					       <a href="#" class="btn btn-primary pull-left mt-3" id="pretwo">Previews</a>
					    </div>
					  </div>
					  <div class="tab-pane fade" id="nav-done" role="tabpanel" aria-labelledby="nav-done-tab">
					      <div class="full-width">
					      	<div class="col-md-8 col-sm-8">
					      	  <div class="border">
					      	     <h4 class=""><strong>Payment Detail</strong></h4>

					      	     <p class="mt-2">Your Name</p>
					      	     <input type="text" class="form-control" placeholder="your Name" name="">
					      	      <p>Your Email Address</p>
					      	     <input type="text" class="form-control" placeholder="your Email Address" name="">
					      	     <p>Your Mobile Number</p>
					      	     <input type="text" class="form-control" placeholder="your Mobile Number" name="">

					      	     <div class="full-width border-top-1 mt-2">
					      	        <p class="mt-2">Payment Type</p>
					      	         <select class="form-control">
					      	         	<option>Credit Card</option>
					      	         	<option>Debit Card</option>
					      	         </select>
					      	         <p>Credit Card Number</p>
					      	         <input type="text" class="form-control" placeholder="your Credit Card Number" name="">
					      	         <div class="col-md-6 col-sm-12">
					      	          <div class="row">
					      	          <img src="<c:url value="/resources/img/creditcards.png" />" class="img-fluid">
					      	          </div>
					      	          </div>
					      	         <div class="full-width mt-2">
					      	            <p>Expiration Date</p>
					      	            <div class="col-md-5 col-sm-5">
					      	               <div class="row">
					      	               	  <select class="form-control">
					      	               	  	<option>MM</option>
					      	               	  	<option>1</option>
					      	               	  	<option>2</option>
					      	               	  	<option>3</option>
					      	               	  	<option>4</option>
					      	               	  	<option>5</option>
					      	               	  	<option>6</option>
					      	               	  	<option>7</option>
					      	               	  	<option>8</option>
					      	               	  	<option>9</option>
					      	               	  	<option>10</option>
					      	               	  	<option>11</option>
					      	               	  	<option>12</option>
					      	               	  </select>
					      	               </div>
					      	            </div>
					      	             <div class="col-md-5 col-sm-5 ml-1">
					      	               <div class="row">
					      	               	  <select class="form-control">
					      	               	  	<option>Year</option>
					      	               	  	<option>2018</option>
					      	               	  	<option>2019</option>
					      	               	  	<option>2020</option>
					      	               	  	<option>2021</option>
					      	               	  	<option>2022</option>
					      	               	  	<option>2023</option>
					      	               	  	<option>2024</option>
					      	               	  	<option>2025</option>
					      	               	  	<option>2026</option>
					      	               	  	<option>2027</option>
					      	               	  	<option>2028</option>
					      	               	  	<option>2029</option>
					      	               	  </select>
					      	               </div>
					      	            </div>
					      	         </div> 
					      	         <p>Security Code</p>
					      	         <input type="text" class="form-control" placeholder="CVV or CVC" name="">
					      	         <div class="col-md-6 col-sm-12">
					      	           <div class="row">
					      	           	  <img src="<c:url value="/resources/img/creditcards1.png" />" class="img-fluid">
					      	           </div>
					      	         </div>
					      	     </div>
					      	  </div>
					      	</div>
					      	<div class="col-md-4 col-sm-4">
					      	  <h4><strong>Booking Detail</strong></h4>
					      	  <div class="full-width mt-3 border-top-1">
					      	  	<p><strong>Cars Detail :</strong> Toyta Camry,2012,5 Seats</p>
					       	    <p><strong>Car Location :</strong> Brisbane,4001</p>
					       	    <p><strong>Price :</strong> $300/day</p>
					       	    <p><strong>Guide :</strong> Haan <span><a href="#" class="">Change</a></span></p>
					      	  </div>
					      	</div>
					      	  <div class="col-md-12 col-sm-12 text-center">
					      	  <h4 class="hadding">Termas & Condition</h4>
					      	  </div>
					      	  <div class="col-md-12 ol-sm-12">
							      	  <div class="white-box-2 mt-4">
									        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
									        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
								     </div>
								     <p><strong><input type="checkbox" id="done" name="" checked=""> <label for="done">I have read and agree <span>Terma</span> & <span>Condition</span></label></strong></p>
						     </div>
						</div>
					      <a href="index" class="btn btn-primary pull-right mt-3" id="">Finish</a>
					       <a href="#" class="btn btn-primary pull-left mt-3" id="prethree">Previews</a>
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
	<li><a href="myorder"><i class="fa fa-file-text-o"></i> Booking History <i class="fa fa-angle-right pull-right"></i></a></li>
	<li><a href="booktrip"><i class="fa fa-bookmark"></i> New Booking <i class="fa fa-angle-right pull-right"></i></a></li>
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
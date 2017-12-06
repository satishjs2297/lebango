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
</head>
<body>
	<div class="hader">
	  <nav class="navbar navbar-expand-lg navbar-light">
	   <div class="container">
		  <a class="navbar-brand" href="index"><img src="<c:url value="/resources/img/logo.png" />"></a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>

		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto text-right">
		      <li class="nav-item">
		        <a class="nav-link" href="">Home</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="login">Login</a>
		      </li>	
		      	      
		    </ul>
		  </div>
		</div>  
	  </nav>
	</div>
	<div class="slider mt-3" style="margin-top: 0px !important;">
	 <div class="container">
	  <div class="row">
	  	<div class="img">
	  		<img class="d-block w-100" src="<c:url value="/resources/img/banner.jpg" />">
	  	</div>
	   <!-- 
	   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block w-100" src="<c:url value="/resources/img/banner.png" />" alt="First slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="<c:url value="/resources/img/banner.png" />" alt="Second slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="<c:url value="/resources/img/banner.png" />" alt="Third slide">
		    </div>
		    
		  </div>
		</div>
		-->
	  </div>
	 </div>	
	</div>
	
	<div class="feature">
	  <div class="container">
	    <div class="row">
	       <div class="full-width text-center">
	          <h4 class="hadding">Features</h4>
	          <p class="mt-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
	          <div class="full-width mt-5">
			          <div class="col-md-4 col-sm-4 border-right">
				            <center>
				            	 <img src="<c:url value="/resources/img/fast.png" />" class="img-fluid">
				            	 <h4 class="sub-hadding mt-4">Fastest Account Activation </h4>
				            </center>
			          </div>
			          <div class="col-md-4 col-sm-4 border-right">
				            <center>
				            	 <img src="<c:url value="/resources/img/fast-2.png" />" class="img-fluid">
				            	 <h4 class="sub-hadding mt-4">Payment Options </h4>
				            </center>
			          </div>
			          <div class="col-md-4 col-sm-4">
				            <center>
				            	 <img src="<c:url value="/resources/img/fast-3.png" />" class="img-fluid">
				            	 <h4 class="sub-hadding mt-4">Settle to any Bank Account </h4>
				            </center>
			          </div>
			          <div class="full-width">
			          	<center>
			          		<img src="<c:url value="/resources/img/image.png" />" class="img-fluid mt-2">
			          	</center>
			          </div>
			  </div> 
			  <div class="full-width mt-3">
			          <div class="col-md-4 col-sm-4 border-right">
				            <center>
				            	 <img src="<c:url value="/resources/img/fast-4.png" />" class="img-fluid">
				            	 <h4 class="sub-hadding mt-4">Android, iOS Support</h4>
				            </center>
			          </div>
			          <div class="col-md-4 col-sm-4 border-right">
				            <center>
				            	 <img src="<c:url value="/resources/img/fast-5.png" />" class="img-fluid">
				            	 <h4 class="sub-hadding mt-4">Review</h4>
				            </center>
			          </div>
			          <div class="col-md-4 col-sm-4 ">
				            <center>
				            	 <img src="<c:url value="/resources/img/fast-6.png" />" class="img-fluid">
				            	 <h4 class="sub-hadding mt-4">Risk Management</h4>
				            </center>
			          </div>
			  </div>        
	       </div>
	    </div>
	  </div>
	</div>
	<!-- 
	<div class="trip">
	   <div class="container">
	     <div class="row">
	      <div class="bg-light-2">
	      <div class="full-width text-center">
	      <h4 class="hadding">trip project</h4>
	       <h4>More Connection,More Booking, More Profit</h4>
	       <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
	       <div class="card mt-4">
	         <div class="col-md-3 col-sm-3">
	            <img src="<c:url value="/resources/img/img-1.png" />" class="img-fluid">
	            <a href="#" class="btn btn-block btn-red">Attraction</a>
	         </div>
	         <div class="col-md-3 col-sm-3">
	            <img src="<c:url value="/resources/img/img-1.png" />" class="img-fluid">
	            <a href="#" class="btn btn-block btn-red">Attraction</a>
	         </div>
	         <div class="col-md-3 col-sm-3">
	            <img src="<c:url value="/resources/img/img-1.png" />" class="img-fluid">
	            <a href="#" class="btn btn-block btn-red">Attraction</a>
	         </div>
	         <div class="col-md-3 col-sm-3">
	            <img src="<c:url value="/resources/img/img-1.png" />" class="img-fluid">
	            <a href="#" class="btn btn-block btn-red">Attraction</a>
	         </div>
	       </div>

	      </div> 
	      </div>
	     </div>
	   </div>
	</div>
	 -->
	<!-- 
	<div class="advertisment">
		<div class="container">
		  <div class="row">
		    <div class="full-width text-center">
		      <h4 class="hadding">advertisement</h4>
		    </div>
		     <div id="#" class=" slide mt-4" >
				  
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				       <div class="col-md-4 col-sm-4">
				         <img src="<c:url value="/resources/img/image-4.png" />" class="img-fluid">
				       </div>
				       <div class="col-md-4 col-sm-4">
				         <img src="<c:url value="/resources/img/image-4.png" />" class="img-fluid">
				       </div>
				       <div class="col-md-4 col-sm-4">
				         <img src="<c:url value="/resources/img/image-4.png" />" class="img-fluid">
				       </div>
				    </div>
				    <div class="carousel-item">
				      <div class="col-md-4 col-sm-4">
				         <img src="<c:url value="/resources/img/image-4.png" />" class="img-fluid">
				       </div>
				       <div class="col-md-4 col-sm-4">
				         <img src="<c:url value="/resources/img/image-4.png" />" class="img-fluid">
				       </div>
				       <div class="col-md-4 col-sm-4">
				         <img src="<c:url value="/resources/img/image-4.png" />" class="img-fluid">
				       </div>
				    </div>
				    <div class="carousel-item">
				      <div class="col-md-4 col-sm-4">
				         <img src="<c:url value="/resources/img/image-4.png" />" class="img-fluid">
				       </div>
				       <div class="col-md-4 col-sm-4">
				         <img src="<c:url value="/resources/img/image-4.png" />" class="img-fluid">
				       </div>
				       <div class="col-md-4 col-sm-4">
				         <img src="<c:url value="/resources/img/image-4.png" />" class="img-fluid">
				       </div>
				    </div>
				  </div>
			</div>
		  </div>
		</div>
	</div>
	 -->
	 <!-- 
	<div class="testemonial">
	   <div class="container">
	     <div class="row">
	      <div class="bg-light-2">
	       <div class="full-width text-center mb-3">
	         <h4 class="hadding">customersâ reviews </h4>
	       </div>
	       <div id="carouselExampleIndicatorsthree" class="carousel slide mt-5" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">

					     <div class="col-md-5 col-sm-5 mr-l-2">
						       <div class="testemonial-user">
						       <center>
						         <div class="user-circel">
						            <img src="<c:url value="/resources/img/user.png" />" class="img-fluid">
						         </div>
						        </center>
						        <div class="box-para mt-2">
						        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
						        </div>
						        <p class="pull-right"><strong>John Doe</strong></p> 
						       </div>
					     </div>
					     <div class="col-md-5 col-sm-5">
						       <div class="testemonial-user">
						       <center>
						         <div class="user-circel">
						            <img src="<c:url value="/resources/img/user.png" />" class="img-fluid">
						         </div>
						        </center>
						        <div class="box-para mt-2">
						        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
						        </div>
						        <p class="pull-right"><strong>John Doe</strong></p> 
						       </div>
					     </div>
				    </div>
				    <div class="carousel-item">
				       <div class="col-md-5 col-sm-5 mr-l-2">
						       <div class="testemonial-user">
						       <center>
						         <div class="user-circel">
						            <img src="<c:url value="/resources/img/user.png" />" class="img-fluid">
						         </div>
						        </center>
						        <div class="box-para mt-2">
						        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
						        </div>
						        <p class="pull-right"><strong>John Doe</strong></p> 
						       </div>
					     </div>
					     <div class="col-md-5 col-sm-5">
						       <div class="testemonial-user">
						       <center>
						         <div class="user-circel">
						            <img src="<c:url value="/resources/img/user.png" />" class="img-fluid">
						         </div>
						        </center>
						        <div class="box-para mt-2">
						        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
						        </div>
						        <p class="pull-right"><strong>John Doe</strong></p> 
						       </div>
					     </div>
				    </div>
				    <div class="carousel-item">
				        <div class="col-md-5 col-sm-5 mr-l-2">
						       <div class="testemonial-user">
						       <center>
						         <div class="user-circel">
						            <img src="<c:url value="/resources/img/user.png" />" class="img-fluid">
						         </div>
						        </center>
						        <div class="box-para mt-2">
						        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
						        </div>
						        <p class="pull-right"><strong>John Doe</strong></p> 
						       </div>
					     </div>
					     <div class="col-md-5 col-sm-5">
						       <div class="testemonial-user">
						       <center>
						         <div class="user-circel">
						            <img src="<c:url value="/resources/img/user.png" />" class="img-fluid">
						         </div>
						        </center>
						        <div class="box-para mt-2">
						        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
						        </div>
						        <p class="pull-right"><strong>John Doe</strong></p> 
						       </div>
					     </div>
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleIndicatorshthree" role="button" data-slide="prev">
				    <span><img src="<c:url value="/resources/img/arrow-2.png" />"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicatorshthree" role="button" data-slide="next">
				    <span><img src="<c:url value="/resources/img/arrow-1.png" />"></span>
				    <span class="sr-only">Next</span>
				  </a>
			</div>
		   </div>	
	     </div>
	   </div>
	</div>
	 -->
<div class="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-sm-12">
        <p><a href="#">Home</a></p>
        <p><a href="#">Services</a></p>
        <p><a href="#">Testimonials</a></p>
        <p><a href="#">Successful Trip Stories</a></p>
        <p><a href="#">Best Service Providers</a></p>
        <p><a href="#">News</a></p>
        <p><a href="#">Account</a></p>                                                
      </div>
     <!-- <div class="col-md-4 col-sm-4">
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
      </div>-->
    </div>
  </div>
</div>

</body>
</html>
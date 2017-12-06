<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.lebango.bean.User,com.lebango.bean.Message,java.util.List" %>

<%
	ServletContext context = request.getSession().getServletContext();
	String language = String.valueOf(context.getAttribute("language"));
	
	HttpSession session = request.getSession();
	User currentUser = (User) session.getAttribute("currentUser");
	String firstname = currentUser.getFirstname();
	String lastname = currentUser.getLastname();
	String photo = currentUser.getPhoto();
	Boolean is_approved = (currentUser.getIs_approved() == 1) ? true: false;
	String logoutPath = request.getContextPath() + "/logout";
	
	List<Message> newMessages = (List<Message>) session.getAttribute("newMessages");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Lebango</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/gentel/vendors/bootstrap/dist/css/bootstrap.min.css" />">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/gentel/vendors/font-awesome/css/font-awesome.min.css" />">
    <!-- NProgress -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/gentel/vendors/nprogress/nprogress.css" />">
    <!-- iCheck -->
    <link href="<c:url value="/resources/gentel/vendors/iCheck/skins/flat/green.css" />" rel="stylesheet">
    <!-- Datatables -->
    <link href="<c:url value="/resources/gentel/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/gentel/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/gentel/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" />" rel="stylesheet">
    <!-- Dropzone.js -->
    <link href="<c:url value="/resources/gentel/vendors/dropzone/dist/min/dropzone.min.css" />" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/gentel/build/css/custom.css" />">
  
    <!-- order form -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
    <!-- datetimepicker -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-datepicker.min.css" />">
    
  </head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="#" class="site_title"><i class="fa fa-paw"></i> <span>Lebango</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- sidebar menu -->
					<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<!-- <h3>Sub title</h3> -->
							<ul class="nav side-menu">
								<li><a href="home"><i class="fa fa-home"></i> Home </a></li>
								<li class="active"><a href="bookorder"><i class="fa fa-pencil"></i> New Booking </a></li>
								<li><a href="bookhistory"><i class="fa fa-book"></i> Book History </a></li>
							</ul>
						</div>
					</div>
					<!-- /sidebar menu -->

				</div>
			</div>

			<!-- top navigation -->
	        <div class="top_nav">
	          <div class="nav_menu">
	            <nav>
	              <div class="nav toggle">
	                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
	              </div>
	
	              <ul class="nav navbar-nav navbar-right">
	                <!-- user information -->
	                <li class="">
	                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
	                    <% if (photo == null || photo.isEmpty()) { %>
	                    		<img src="<c:url value="/resources/gentel/images/user.png" />">		
	                    <%} else {%>
	                    		<img src="<c:url value="<%=photo %>" />">
	                    <%} %> 
	                    <%=firstname + " " + lastname %>
	                    <span class=" fa fa-angle-down"></span>
	                  </a>
	                  <ul class="dropdown-menu dropdown-usermenu pull-right">
	                    <li><a href="profile"> Profile</a></li>
	                    <li><a href="<%=logoutPath %>"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
	                  </ul>
	                </li>
					<!-- user information -->
					
				    <!-- message -->
	                <li role="presentation" class="dropdown">
	                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
	                    <i class="fa fa-envelope-o"></i>
					    <% if (newMessages != null && newMessages.size() > 0) { %>
						<span class="badge bg-green"><%=newMessages.size() %></span>
						<% } %>
	                  </a>
	                  <% if (newMessages != null && newMessages.size() > 0) { %>
	                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
	                  <% for(int i=0; i<newMessages.size(); i++) { %>
			            <li>
			            <a>
	                        <span class="image">
	                        <img src="<c:url value="/resources/gentel/images/user.png" />" alt="Profile Image">
	                        </span>
	                        <span>
	                          <span>Administrator</span>
	                          <!-- <span class="time">3 mins ago</span> -->
	                        </span>
	                        <span class="message">
	                          <%=newMessages.get(i).getTitle() %>
	                        </span>
	                     </a>
	                     </li>
			          <%} %>
	                   
	                    <li>
	                      <div class="text-center">
	                        <a href="inbox">
	                          <strong>See All Messages</strong>
	                          <i class="fa fa-angle-right"></i>
	                        </a>
	                      </div>
	                    </li>
	                  </ul>
	                  <% } %>
	                </li>
	              	<!-- message -->
	              </ul>
	            </nav>
	          </div>
	        </div>
	        <!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>New Booking</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="carousel slide media-carousel" id="media">
						        <div class="carousel-inner">
						          <div class="item  active">
						            <div class="row">
						              <div class="col-md-4">
						                <a class="thumbnail" href="#" style="height: 100%;"><img alt="" src="<c:url value="/resources/img/car.png" />" style="width: 100%;height: 100%;"></a>
						              </div>          
						              <div class="col-md-4">
						                <a class="thumbnail" href="#" style="height: 100%;"><img alt="" src="<c:url value="/resources/img/car.png" />" style="width: 100%;height: 100%;"></a>
						              </div>
						              <div class="col-md-4">
						                <a class="thumbnail" href="#" style="height: 100%;"><img alt="" src="<c:url value="/resources/img/car.png" />" style="width: 100%;height: 100%;"></a>
						              </div>        
						            </div>
						          </div>
						          <div class="item">
						            <div class="row">
						              <div class="col-md-4">
						                <a class="thumbnail" href="#" style="height: 100%;"><img alt="" src="<c:url value="/resources/img/car.png" />" style="width: 100%;height: 100%;"></a>
						              </div>          
						              <div class="col-md-4">
						                <a class="thumbnail" href="#" style="height: 100%;"><img alt="" src="<c:url value="/resources/img/car.png" />" style="width: 100%;height: 100%;"></a>
						              </div>
						              <div class="col-md-4">
						                <a class="thumbnail" href="#" style="height: 100%;"><img alt="" src="<c:url value="/resources/img/car.png" />" style="width: 100%;height: 100%;"></a>
						              </div>        
						            </div>
						          </div>
						          <div class="item">
						            <div class="row">
						              <div class="col-md-4">
						                <a class="thumbnail" href="#" style="height: 100%;"><img alt="" src="<c:url value="/resources/img/car.png" />" style="width: 100%;height: 100%;"></a>
						              </div>          
						              <div class="col-md-4">
						                <a class="thumbnail" href="#" style="height: 100%;"><img alt="" src="<c:url value="/resources/img/car.png" />" style="width: 100%;height: 100%;"></a>
						              </div>
						              <div class="col-md-4">
						                <a class="thumbnail" href="#" style="height: 100%;"><img alt="" src="<c:url value="/resources/img/car.png" />" style="width: 100%;height: 100%;"></a>
						              </div>      
						            </div>
						          </div>
						        </div>
						        <a data-slide="prev" href="#media" class="left carousel-control">‹</a>
						        <a data-slide="next" href="#media" class="right carousel-control">›</a>
						    </div>       
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<!-- 
								<div class="x_title">
									<h2>Follow the steps to book.</h2>

									<div class="clearfix"></div>
								</div>
								-->
								<div class="x_content">
									<!-- order form -->
									<div class="book-a-trip">
										  <div class="container">
										    <div class="row">

										    		<div class="full-width">
											        	<div class="col-md-8 col-sm-8 ml-20  feild">
											        	  <div class="set-sign-up">
											        	  
											        	   <nav class="nav nav-tabs" id="myTab" role="tablist">
															  <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true"><span class="number-circel">1</span> Setup </a>
															  <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false"><span class="number-circel">2</span> Setup </a>
															  <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false"><span class="number-circel">3</span> Setup </a>
															  <a class="nav-item nav-link" id="nav-done-tab" data-toggle="tab" href="#nav-done" role="tab" aria-controls="nav-done" aria-selected="false"><span class="number-circel">4</span> Setup </a>
															</nav>
															<div class="tab-content mt-5" id="nav-tabContent" style="margin-top: 3rem !important;">
															  <div class="tab-pane fade active show in" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
															      <div class="full-width" style="margin-bottom: 20px;">
															      	<h4 style="margin:10px;">Select State *</h4>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="1" name="location"/> NSW
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">  
															      		<input type="radio" value="2" name="location"/> VIC
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">  
															      		<input type="radio" value="3" name="location"/> QLD
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="4" name="location"/> SA
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="5" name="location"/> TAS
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="6" name="location"/> WA
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="7" name="location"/> ACT
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="8" name="location"/> NT
															      	</span>  
															      </div>
															      
															      <div class="full-width" style="margin-bottom: 20px;">
															      	<h4 style="margin:10px;">Seat Number *</h4>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="7" name="seat"/> 7s
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">  
															      		<input type="radio" value="14" name="seat"/> 14s
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">  
															      		<input type="radio" value="21" name="seat"/> 21s
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="25" name="seat"/> 25s
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="33" name="seat"/> 33s
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="35" name="seat"/> 35s
															      	</span>
															      	<span style="margin-left:10px; margin-right:10px;">
															      		<input type="radio" value="41" name="seat"/> 41s
															      	</span>  
															      </div>
															      <div class="full-width">
															      	<div class="col-md-6 col-sm-6">
															      	    <h4>Pickup Date & Time *</h4>
															      	    <div class="input-group date" data-provide="datepicker" style="margin-top: 10px;">
																		    <input type="text" class="form-control" style="margin-top:0px;">
																		    <div class="input-group-addon" style="padding: 6px 12px;margin: 0px;font-size:14px;height: 0px;">
																		        <span class="glyphicon glyphicon-th"></span>
																		    </div>
																		</div>
															      	    <div class="col-md-6 col-sm-6">
																      	    <div class="row">
																      	     	<select class="form-control set-option" style="margin:0px;">
																	      	     	<option>Select Time</option>
																	      	     	<option>10:00 AM</option>
																	      	     	<option>12:00 PM</option>
																	      	     	<option>07:00 PM</option>
																	      	     </select>
																	      	</div>
																      	</div>    
															      	</div>
															      	<div class="col-md-6 col-sm-6">
															      	    <h4>Drop off Date & Time *</h4>
															      	    <div class="input-group date" data-provide="datepicker" style="margin-top: 10px;">
																		    <input type="text" class="form-control" style="margin-top:0px;">
																		    <div class="input-group-addon" style="padding: 6px 12px;margin: 0px;font-size:14px;height: 0px;">
																		        <span class="glyphicon glyphicon-th"></span>
																		    </div>
																		</div>
															      	    <div class="col-md-6 col-sm-6">
																      	    <div class="row">
																	       	    <select class="form-control set-option" style="margin:0px;">
																	      	     	<option>Select Time</option>
																	      	     	<option>10:00 AM</option>
																	      	     	<option>12:00 PM</option>
																	      	     	<option>07:00 PM</option>
																	      	    </select>
																	      	</div>
															      		</div> 
															      	</div>
															      </div>
															      <div class="full-width mt-4" style="margin-top:20px;margin-bottom:10px;">
															      	<div class="col-md-6 col-sm-6">
															      	    <h4>Pickup Location *</h4>
															      	    <div class="col-md-8 col-sm-8" style="padding: 0px;">
																		    <select class="form-control">
																			    	<option>Select Location</option>
																			    	<option>Brisbane</option>
																		    </select>
																	    </div>
															      	</div>						      	
															      	<div class="col-md-6 col-sm-6">
														      	        <h4>Drop off Location *</h4>
																	    <div class="col-md-8 col-sm-8" style="padding: 0px;">
																		    <select class="form-control" >
																			    	<option>Select Location</option>
																			    	<option>Gold Coast</option>
																		    </select>
																	    </div>
															      	</div>
																  </div>
																  
															      <div class="full-width mt-5" >
																       <div class="col-md-6 col-sm-6">
													                       <h4>Day 1 Trip</h4>
																		   <select class="form-control">
																		  	<option>Brisbane Hotel - Gold Coast Airport</option>
																		   </select>
																       </div>
																  </div>
																  <div class="full-width mt-5">
																       <div class="col-md-6 col-sm-6">
													                       <h4>Day 2 Trip</h4>
																		   <select class="form-control">
																		  	<option>Brisbane Hotel - Gold Coast Airport</option>
																		   </select>
																       </div>
																  </div>
																  <div class="full-width mt-5">
																       <div class="col-md-6 col-sm-6">
													                       <h4>Day 3 Trip</h4>
																		   <select class="form-control">
																		  	<option>Brisbane Hotel - Gold Coast Airport</option>
																		   </select>
																       </div>
																  </div>
																  <a href="#" class="btn btn-primary pull-right mt-3" id="nextone">Next</a>
															  </div>
															  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
															     <div class="full-width">
															       <div id="custom-search-input">
														                <div class="input-group col-md-12" style="margin-bottom:0px; margin-top:0px;">
														                    <input type="text" class="form-control input-lg" placeholder="Car Name.." style="margin-top:0px;font-size:14px;"/>
														                    <span class="input-group-btn">
														                        <button class="btn btn-info btn-lg" type="button">
														                            <i class="glyphicon glyphicon-search"></i>
														                        </button>
														                    </span>
														                </div>
														           </div>
															     </div>
															     <div class="full-width mt-4" style="margin-top: 1.5rem !important;">
															       <div class="veichel-box">
															       	  <div class="col-md-3 col-sm-3">
															       	    <div class="row">
															       	    <div class="veichel-img">
															       	    		<img src="<c:url value="/resources/img/car.png" />" class="img-fluid" style="max-width: 100%;height: auto;">
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
															       	    	<img src="<c:url value="/resources/img/car.png" />" class="img-fluid" style="max-width: 100%;height: auto;">
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
															       	    	<img src="<c:url value="/resources/img/car.png" />" class="img-fluid" style="max-width: 100%;height: auto;">
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
															       	    	<img src="<c:url value="/resources/img/car.png" />" class="img-fluid" style="max-width: 100%;height: auto;">
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
															       <a href="#" class="btn btn-primary pull-right mt-3" id="nexttwo" style="margin-top:15px;">Next</a>
															       <a href="#" class="btn btn-primary pull-left mt-3" id="pre" style="margin-top:15px;">Previous</a>
															     </div>
															  </div>
															  
															  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
															    <div class="full-width text-center" style="margin-bottom: 15px;">
															    	<h4 class="hadding">Traveler Information File</h4>
															    </div>
															    <div class="full-width ">
																      <div class="col-md-6 col-sm-6">
																            <h4 class="mt-3"><strong>Upload File 4</strong></h4>
																        		<div class="panel panel-default">
																				<div class="panel-body">
																					<input type="file" id="business_register_certificate" name="business_register_certificate" >
																				</div>
																			</div>
																      </div>
																      <div class="col-md-6 col-sm-6 text-right">
																         <p class="green mt-5" style="margin-top: 1.5em;"><i class="fa fa-check-circle"></i> Upload Successful</p>
																      </div>
															    </div>
															    <div class="full-width">
																      <div class="col-md-6 col-sm-6">
																            <h4 class="mt-3"><strong>Upload File 4</strong></h4>
																        		<div class="panel panel-default">
																				<div class="panel-body">
																					<input type="file" id="business_register_certificate" name="business_register_certificate" >
																				</div>
																			</div>
																      </div>
																      <div class="col-md-6 col-sm-6 text-right">
																         <p class="green mt-5" style="margin-top: 1.5em;"><i class="fa fa-check-circle"></i> Upload Successful</p>
																      </div>
															    </div>
										
															    <div class="full-width">
																       <div class="col-md-6 col-sm-6">
																            <h4 class="mt-3"><strong>Upload File 4</strong></h4>
																        		<div class="panel panel-default">
																				<div class="panel-body">
																					<input type="file" id="business_register_certificate" name="business_register_certificate" >
																				</div>
																			</div>
																      </div>
																      <div class="col-md-6 col-sm-6 text-right">
																         <p class="green mt-5" style="margin-top: 1.5em;"><i class="fa fa-check-circle"></i> Upload Successful</p>
																      </div>
															    </div>
										
															    <div class="full-width">
																      <div class="col-md-6 col-sm-6">
																            <h4 class="mt-3"><strong>Upload File 4</strong></h4>
																        		<div class="panel panel-default">
																				<div class="panel-body">
																					<input type="file" id="business_register_certificate" name="business_register_certificate" >
																				</div>
																			</div>
																      </div>
																      <div class="col-md-6 col-sm-6 text-right">
																         <p class="green mt-5" style="margin-top: 1.5em;"><i class="fa fa-check-circle"></i> Upload Successful</p>
																      </div>
															    </div>
										
															    <div class="full-width">
															    		  <div class="col-md-6 col-sm-6">
																            <h4 class="mt-3"><strong>Upload File 4</strong></h4>
																        		<div class="panel panel-default">
																				<div class="panel-body">
																					<input type="file" id="business_register_certificate" name="business_register_certificate" >
																				</div>
																			</div>
																      </div>
																      <div class="col-md-6 col-sm-6 text-right">
																         <p class="red mt-5" style="margin-top: 1.5em;"><i class="fa fa-times-circle"></i> Upload Cancelled</p>
																      </div>
															    </div>
										
															    <div class="full-width text-center mt-3" style="margin-bottom: 20px;">
															    		<h4 class="hadding">Additional Request</h4>
															    </div>
															    <div class="full-width mt-4">
															       <div class="col-md-12 col-sm-12" style="margin-bottom: 20px;">
																      	<textarea placeholder="Further option" rows="4" style="width: 100%;"></textarea>
															       </div>
															       <a href="#" class="btn btn-primary pull-right mt-3" id="nextthree">Next</a>
															       <a href="#" class="btn btn-primary pull-left mt-3" id="pretwo">Previous</a>
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
															      	            
															      	            <div class="full-width mt-2">
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
															      	<div class="col-md-12 col-sm-12 text-center" style="margin-bottom: 12px;">
															      		<h4 class="hadding">Terms & Conditions</h4>
															      	</div>
															      	<div class="col-md-12 ol-sm-12" style="margin-bottom: 20px;">
																     	<div class="white-box-2 mt-4">
																	       <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
																	       <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
																	    </div>
																		<p><strong><input type="checkbox" id="done" name="" checked=""> <label for="done">I have read and agree <span>Terms</span> & <span>Conditions.</span></label></strong></p>
																    </div>
																</div>
															    <a href="index.html" class="btn btn-primary pull-right mt-3" id="">Finish</a>
															    <a href="#" class="btn btn-primary pull-left mt-3" id="prethree">Previous</a>
															  </div>
															</div>
														 </div>	
											        	  </div>
											       </center>	  
											    </div>
										     </div>
										  </div>
									   </div>
									<!-- /order form-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">Lebango Platform 2017</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>
	
	<!-- Order Form -->
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.js" />"></script>
	<!-- <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.slim.js" />"></script> -->
	<script type="text/javascript" src="<c:url value="/resources/js/popper.min.js" />"></script> 
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />"></script>	
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap-clockpicker.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/dopdown.js" />"></script>

	<!-- jQuery -->
	<script	src="<c:url value="/resources/gentel/vendors/jquery/dist/jquery.min.js" />"></script>
	<!-- Bootstrap -->
	<script	src="<c:url value="/resources/gentel/vendors/bootstrap/dist/js/bootstrap.min.js" />"></script>
	<!-- FastClick -->
	<script	src="<c:url value="/resources/gentel/vendors/fastclick/lib/fastclick.js" />"></script>
	<!-- NProgress -->
	<script	src="<c:url value="/resources/gentel/vendors/nprogress/nprogress.js" />"></script>
	<!-- jQuery Smart Wizard -->
	<script	src="<c:url value="/resources/gentel/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js" />"></script>
	<!-- Dropzone.js -->
    <script src="<c:url value="/resources/gentel/vendors/dropzone/dist/min/dropzone.min.js" />"></script>
	<!-- bootstrap-daterangepicker -->
    <script src="<c:url value="/resources/gentel/js/moment/moment.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/js/datepicker/daterangepicker.js" />"></script>
    <!-- bootstrap-datepicker -->
    <script src="<c:url value="/resources/gentel/js/datepicker/bootstrap-datepicker.min.js" />"></script>
    
    <!-- Datatables -->
    <script src="<c:url value="/resources/gentel/vendors/datatables.net/js/jquery.dataTables.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/vendors/datatables.net-buttons/js/dataTables.buttons.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/vendors/datatables.net-buttons/js/buttons.flash.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/vendors/datatables.net-buttons/js/buttons.html5.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/vendors/datatables.net-buttons/js/buttons.print.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/vendors/jszip/dist/jszip.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/vendors/pdfmake/build/pdfmake.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/vendors/pdfmake/build/vfs_fonts.js" />"></script>
	
	<!-- Custom Theme Scripts -->
	<script src="<c:url value="/resources/gentel/build/js/custom.min.js" />"></script>
		<!-- jQuery Smart Wizard -->
	<script>
      $(document).ready(function() {
    	  	$('#media').carousel({	
  		    pause: true,
  		    interval: false,
  		});	
    	  
    	  	$('.datepicker').datepicker();
    	  	
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
      		
      		// $( "#datepicker" ).datepicker();
    	    		// $( "#datepickertwo" ).datepicker();
      });
      
    </script>
	<!-- /jQuery Smart Wizard -->

</body>
</html>

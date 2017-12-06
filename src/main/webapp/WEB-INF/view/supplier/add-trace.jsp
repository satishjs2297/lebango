<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    <!-- bootstrap-wysiwyg -->
    <link href="<c:url value="/resources/gentel/vendors/google-code-prettify/bin/prettify.min.css" />" rel="stylesheet">
    <!-- Select2 -->
    <link href="<c:url value="/resources/gentel/vendors/select2/dist/css/select2.min.css" />" rel="stylesheet">
    <!-- Switchery -->
    <link href="<c:url value="/resources/gentel/vendors/switchery/dist/switchery.min.css" />" rel="stylesheet">
    <!-- starrr -->
    <link href="<c:url value="/resources/gentel/vendors/starrr/dist/starrr.css" />" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/gentel/build/css/custom.css" />">
  
  	<style type="text/css">
  		.btn-file {
		    position: relative;
		    overflow: hidden;
		}
		.btn-file input[type=file] {
		    position: absolute;
		    top: 0;
		    right: 0;
		    min-width: 100%;
		    min-height: 100%;
		    font-size: 100px;
		    text-align: right;
		    filter: alpha(opacity=0);
		    opacity: 0;
		    outline: none;
		    background: white;
		    cursor: inherit;
		    display: block;
		}
		
		#img-upload1{
		    width: 100%;
		}
		#img-upload2{
		    width: 100%;
		}
		#img-upload3{
		    width: 100%;
		}
		#img-upload4{
		    width: 100%;
		}
  	</style>
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
                <ul class="nav side-menu">
                  <li><a href="home"><i class="fa fa-home"></i> Home </a></li>
                  
                  <li><a><i class="fa fa-book"></i> Bookings <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" >
                      <li><a href="upcoming-bookings">Upcoming Bookings</a></li>
                      <li><a href="finished-bookings">Finished Bookings</a></li>
                    </ul>
                  </li>
                  
                  <li><a><i class="fa fa-automobile"></i> Cars <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="manage-car">Manage Cars</a></li>
                      <li><a href="add-car">Add Car</a></li>
                    </ul>
                  </li>
                  
                  <li><a><i class="fa fa-user"></i> Guides <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="manage-guide">Manage Guide</a></li>
                      <li><a href="add-guide">Add Guide</a></li>
                    </ul>
                  </li>
                  
                  <li><a><i class="fa fa-usd"></i> Prices List <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="manage-traces">Manage Prices</a></li>
                      <li class="current-page"><a href="add-trace">Add Price</a></li>
                    </ul>
                  </li>
                  
                  <li><a href="invoices"><i class="fa fa-credit-card"></i> Invoices </a></li>
                  <li><a href="inbox"><i class="fa fa-envelope-o"></i> Inbox </a></li>
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
                    <li>
                    	 <a href="javascript:;">
                      <% if (is_approved == true) {%>
                        <span class="badge bg-blue pull-right">approved</span>
                      <%} else {%>
                        <span class="badge bg-red pull-right">not approved</span>
                      <%} %>
                        <span>Status</span>
                     </a>
                    </li>
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
                <h3>Add Trace</h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="row">
            	  <!-- Add Parent Trace -->
              <div class="col-md-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Add New Trace</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form:form method="POST" action="register-trace" modelAttribute="traceForm" class="form-horizontal form-label-left" id="trace_form">
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"> From <span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:select path="start_location" class="select2_group form-control" id="select_start_location">
                            <c:if test="${not empty location_array}">
		                    	<c:forEach var="model" items="${location_array}">
		                    		<option value="${model.id}">${model.name}</option>
		                     </c:forEach>
		                     </c:if>
                           </form:select>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"> To <span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:select path="end_location" class="select2_group form-control" id="select_end_location">
                            <c:if test="${not empty location_array}">
		                    	<c:forEach var="model" items="${location_array}">
		                    		<option value="${model.id}">${model.name}</option>
		                     </c:forEach>
		                     </c:if>
                           </form:select>
                        </div>
                      </div>
   
			          <div class="ln_solid"></div>
			          
                      <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                          <button type="reset" class="btn btn-primary">Cancel</button>
                          <button type="submit" class="btn btn-success">Add Trace</button>
                        </div>
                      </div>

                    </form:form>
                  </div>
                </div>
              </div>
            	 <!-- /Add Parent Trace -->
            	 
            	 <!-- Add Sub Trace -->
            	 <div class="col-md-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Add Sub Trace</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form:form method="POST" action="register-sub-trace" modelAttribute="subtraceForm" class="form-horizontal form-label-left" id="sub_trace_form">
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"> Select Trace <span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:select path="parent_trace" class="select2_group form-control">
                             <c:if test="${not empty trace_array}">
		                    	<c:forEach var="model" items="${trace_array}">
		                    		<option value="${model.trace_id}">${model.start_location} - ${model.end_location}</option>
		                     </c:forEach>
		                     </c:if>
                           </form:select>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Sub Trace<span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:input path="name" type="text" class="form-control" placeholder="input name (ex: Perth Air't-Wild dark park-Lake Shailwre)" />
                        </div>
                      </div>
                   
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">7s<span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:input path="seat_7s" type="text" class="form-control" placeholder="input price" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">14s<span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:input path="seat_14s" type="text" class="form-control" placeholder="input price" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">21s<span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:input path="seat_21s" type="text" class="form-control" placeholder="input price" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">25s<span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:input path="seat_25s" type="text" class="form-control" placeholder="input price" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">33s<span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:input path="seat_33s" type="text" class="form-control" placeholder="input price" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">45s<span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:input path="seat_45s" type="text" class="form-control" placeholder="input price" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">55s<span class="required">*</span></label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:input path="seat_55s" type="text" class="form-control" placeholder="input price" />
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Description</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <form:input path="description" type="text" class="form-control" placeholder="write short description" />
                        </div>
                      </div>
					 
			          <div class="ln_solid"></div>
			          
                      <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                          <button type="reset" class="btn btn-primary">Cancel</button>
                          <button type="submit" class="btn btn-success">Add Sub Trace</button>
                        </div>
                      </div>

                    </form:form>
                  </div>
                </div>
              </div>
            	 <!-- /Add Sub Trace -->
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Lebango Platform 2017
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>
	
    <!-- jQuery -->
    <script src="<c:url value="/resources/gentel/vendors/jquery/dist/jquery.min.js" />"></script>
    <!-- Bootstrap -->
    <script src="<c:url value="/resources/gentel/vendors/bootstrap/dist/js/bootstrap.min.js" />"></script>
    <!-- FastClick -->
    <script src="<c:url value="/resources/gentel/vendors/fastclick/lib/fastclick.js" />"></script>
    <!-- NProgress -->
    <script src="<c:url value="/resources/gentel/vendors/nprogress/nprogress.js" />"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="<c:url value="/resources/gentel/build/js/custom.min.js" />"></script>
   
    <script type="text/javascript">
		$(document).ready( function() {
			$('#trace_form').submit(function() {
			    var start_location = $('#select_start_location').val();
			    var end_location = $('#select_end_location').val();
			    if (start_location == end_location) {
			    		alert('Select different location.');
			    		return false; // return false to cancel form action
			    }
			    
			    return true;
			});
			
			$('#sub_trace_form').submit(function() {
			    	return true;
			});
		});
	</script>
  </body>
</html>

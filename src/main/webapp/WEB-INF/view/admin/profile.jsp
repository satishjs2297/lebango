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
		
		#img-upload {
		    width: 30%;
		}
  	</style>
  </head>

  <body class="nav-md footer_fixed">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="#" class="site_title"><i class="fa fa-paw"></i> <span>Lebango</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- sidebar menu -->
			<div id="sidebar-menu"
				class="main_menu_side hidden-print main_menu">
				<div class="menu_section">
					<!-- <h3>Sub title</h3> -->
					<ul class="nav side-menu">
						<li>
							<a href="home"><i class="fa fa-home"></i> Home </a>
						</li>
						<li>
							<a href="suppliers"><i class="fa fa-taxi"></i> Suppliers </a>
						</li>
						<li>
							<a href="agents"><i class="fa fa-user"></i> Agents </a>
						</li>
						<li>
							<a href="organizations"><i class="fa fa-users"></i> Organizations </a>
						</li>
						<li>
							<a href="orders"><i class="fa fa-book"></i> Orders </a>
						</li>
						<li>
							<a href="transactions"><i class="fa fa-credit-card"></i> Transactions </a>
						</li>
						<li>
							<a href="register_requests"><i class="fa fa-pencil"></i> Register Requests </a></li>
						<li>
							<a href="inbox"><i class="fa fa-envelope-o"></i> Inbox </a>
						</li>
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
                <h3>Edit Profile</h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Fill following form.</h2>
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
                    <!--  MISSING:: data-parsley-validate -->
                    <form:form method="POST" action="update-profile" modelAttribute="userForm" enctype="multipart/form-data" id="demo-form2" class="form-horizontal form-label-left">

                      <div class="form-group">
                        <form:label class="control-label col-md-3 col-sm-3 col-xs-12" path="firstname">First Name <span class="required">*</span>
                        </form:label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input path="firstname" type="text" id="firstname" required="required" class="form-control col-md-7 col-xs-12" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Last Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input path="lastname" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12" />
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <form:label class="control-label col-md-3 col-sm-3 col-xs-12" path="company_name">Company Name <span class="required">*</span>
                        </form:label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input path="company_name" type="text" id="company_name" required="required" class="form-control col-md-7 col-xs-12" />
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <form:label path="email" class="control-label col-md-3 col-sm-3 col-xs-12">Email <span class="required">*</span>
                        </form:label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input path="email" type="text" id="email" required="required" class="form-control col-md-7 col-xs-12" />
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <form:label path="phone" class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">Phone <span class="required">*</span>
                        </form:label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input path="phone" type="text" id="phone" name="phone" required="required" class="form-control col-md-7 col-xs-12" />
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <form:label path="password" class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Password <span class="required">*</span>
                        </form:label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input path="password" type="password" id="password" name="password" required="required" class="form-control col-md-7 col-xs-12" />
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <form:label path="confirm_password" class="control-label col-md-3 col-sm-3 col-xs-12" for="confirm">Confirm <span class="required">*</span>
                        </form:label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input path="confirm_password" type="password" id="confirm" name="confirm" required="required" class="form-control col-md-7 col-xs-12" />
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="photo" class="control-label col-md-3 col-sm-3 col-xs-12">Photo <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <span class="btn btn-default btn-file">
				                Browse… <input type="file" name="photo" id="imgInp">
			                </span>
			                <br />
			                <img id='img-upload'/>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <form:label path="description" for="description" class="control-label col-md-3 col-sm-3 col-xs-12">Description <span class="required">*</span>
                        </form:label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input path="description" id="description" class="form-control col-md-7 col-xs-12" type="text" name="description" />
                        </div>
                      </div>
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="reset" class="btn btn-primary">Cancel</button>
                          <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                      </div>

                    </form:form>
                  </div>
                </div>
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
 
    <!-- bootstrap-daterangepicker -->
    <script src="<c:url value="/resources/gentel/js/moment/moment.min.js" />"></script>
    <script src="<c:url value="/resources/gentel/js/datepicker/daterangepicker.js" />"></script>
    <!-- bootstrap-wysiwyg -->
    
    <!-- Custom Theme Scripts -->
    <script src="<c:url value="/resources/gentel/build/js/custom.min.js" />"></script>
    
    <script type="text/javascript">  
	$(document).ready( function() {
	    	$(document).on('change', '.btn-file :file', function() {
			var input = $(this),
				label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		});

		function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $('#img-upload').attr('src', e.target.result);
		        }
		        var cur_min_height = $(".right_col").css("min-height");
		        $(".right_col").css("min-height", "1000px");
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		
		$("#imgInp").change(function(){
		    readURL(this);
		}); 	
	});
	</script>
  </body>
</html>

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
    
    <!-- Custom Theme Style -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/gentel/build/css/custom.css" />">
  
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
						<li class="active">
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
                <h3>Manage Register Requests</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>List of Supplier Register Requests</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Company name</th>
                          <th>Email</th>
                          <th>Phone</th>
                          <th>Contact Person</th>
                          <th>Requested At</th>
                          <th>Edit</th>
                        </tr>
                      </thead>

                      <tbody>
                        <tr>
                          <td>AU Car Service Provider</td>
                          <td>daniel@hotmail.com</td>
                          <td>+1 309 3905 7864</td>
                          <td>Lauren Tony</td>
                          <td>2017-10-05</td>
                          <td>
                            <a href="viewcar?id=8" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                            <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                            <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
        <!-- /page content -->

		 <!-- Large modal -->
		 <!-- 
           <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button>

             <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog modal-lg">
                 <div class="modal-content">

                   <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                     </button>
                     <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                   </div>
                   <div class="modal-body">
                     <h4>Text in a modal</h4>
                     <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                     <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
                   </div>
                   <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                     <button type="button" class="btn btn-primary">Save changes</button>
                   </div>

                 </div>
               </div>
            </div>
           -->
           <!-- Large modal -->
           
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
    <!-- iCheck -->
    <script src="<c:url value="/resources/gentel/vendors/iCheck/icheck.min.js" />"></script>
    
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
    <!-- Datatables -->
    <script>
      $(document).ready(function() {
    	  	$('#datatable').dataTable();
      });
    </script>
    
  </body>
</html>

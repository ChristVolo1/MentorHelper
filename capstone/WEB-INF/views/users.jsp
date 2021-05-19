<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
<head>
	<meta http-equiv="refresh"  CONTENT="<%= session.getMaxInactiveInterval() %>;URL='${contextPath}/customers'" />
	<meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="#">
  
  <meta name="author" content="#">

  <title>Members</title>

 <!-- Mobile Specific Meta-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="static/images/favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="static/plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="static/plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Revolution Slider -->
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/fonts/font-awesome/css/font-awesome.css">

  <!-- REVOLUTION STYLE SHEETS -->
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/css/settings.css">
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/css/layers.css">
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/css/navigation.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="static/css/style.css">

</head>

<body id="body">

<!-- Main Menu Section -->
<jsp:include page="header.jsp"/>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">Members</h1>
					<ol class="breadcrumb">
						<li><a href="index">Home</a></li>
						<li class="active">Users</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<section class="user-dashboard page-wrapper">
  <div class="container">
    <div class="row">
    
         
	           
      <div class="col-md-12">
	       <form action="search" method="post" class="form-inline col-md-4">	 
		     <div class="row">    
		     <input type="search" name="keyword" id="searchnow" class="form-control" placeholder="Search users...">
		     <button type="submit" class="btn btn-danger"><i class="tf-ion-ios-search-strong"></i></button>
		     </div>
		   </form><br>
		   <h3>
	         <a href="#">${list.size()} ${msg} ${success} </a>
	         <c:if test="${empty list}">
		 		search results <a href="customers"class="btn btn-default">Reload</a>
		     </c:if>
		   </h3>
		 
		  <c:if test="${not empty list}">
          <div class="table-responsive">
          
            <table class="table">
					 <tr class="text-success">
					 <th>#</th>
					 <th>Image</th>
					 <th>
					 Name <i class="tf-ion-android-person"></i> (${list.size()})
	     		     </th>
	     		     <th>Services</th>
					 <c:if test="${role eq 'ADMIN'}">
					 <th>Roles</th>
					 <th>Edit</th>
					 </c:if>
					 </tr>
				 <tbody>
					 <c:forEach var="item" items="${list}" >
					 <tr>
					 <td>${list.indexOf(item)+1}.</td>
					 <td>
					 <c:if test="${not empty item.image}">
					 <img class="d-flex justify-content-center" src="static/images/users/${item.id}/profile/${item.image}" 
						 alt="${item.fname} ${item.lname}" style="width: 70px; height: 70px; border-radius: 50%;">
					 </c:if>
					 <c:if test="${empty item.image}">
					 <p>No Image</p>
					 </c:if>
					 </td>
					 <td>
					  ${item.fname} ${item.lname}
					  <c:if test="${not empty item.getAddress()}">		              
		              <a href="#" data-toggle="modal" data-target="#view${item.id}" 
                      class="btn btn-default"><i class="tf-ion-ios-search-strong"></i>
                      </a>
                      </c:if>
                      <br>
                      ${item.getAddress().city} ${item.getAddress().state}
                      <div class="modal fade" id="view${item.id}">
					    <div class="modal-dialog modal-sm">
						<div class="modal-content">	      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		 <h3 class="text-info">
			    		  <i class="tf-ion-android-person"></i> ${item.fname} ${item.lname}
			    		 </h3>
			    		 <p>
			    		  <i class="tf-ion-ios-home"></i> ${item.getAddress().street} 
		                  ${item.getAddress().city}  ${item.getAddress().zip}<br>
		                  <c:forEach var="fone" items="${item.getPhoneBook()}">				    		
				    	  <i class="tf-ion-android-phone-portrait"></i> ${fone.type}: ${fone.tel}	<br>			    		
				    	 </c:forEach>
			    		 </p>
                         
	                     </div>
					    </div>	
				      </div>
					  </div>
                      <br>
					 
					 </td>
					 <td>
					 	<form action="viewServices" method="get">
					 		<input type="hidden" name="userId" value="${item.id}"/>
					 		<button type="submit" class="btn btn-primary">View Services</button>
					 	</form>

					 </td>

					 <c:if test="${role eq 'ADMIN'}">
					 <td>
	                 <form method="POST" action="editrole" >		    									
							<input type="hidden" name="id" value="${item.id}" />		    	 
							<select onchange="this.form.submit()" name="role" class="form-control">
							<option value="${item.role}">${item.role}</option>
							<option value="USER">USER </option>
							<option value="DBA">DBA</option>
							<option value="ADMIN">ADMIN</option>												  
						 </select>												
					   </form>
	                 </td>
                     <td>
                     <a href="delete?id=${item.id}" onclick="confirmed(); return false;" title="Delete member ${item.fname} ${item.lname}" class="btn btn-default"> <i class="tf-ion-close"></i></a>
                     <a href="#" data-toggle="modal" data-target="#edit${item.id}" 
                     class="tf-pencil2"></a>                    
                     <div class="modal fade" id="edit${item.id}">
					    <div class="modal-dialog modal-md">
						<div class="modal-content">	      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		 <h3 class="text-success">
			    		 Updating ${item.fname} ${item.lname} 
			    		 </h3>
                         <form:form class="text-left clearfix" action="updateuser" modelAttribute="update" method="post"> 
				            <div class="form-group">
				              <form:input type="text" path="fname"  class="form-control"  value="${item.fname}" placeholder="First Name"/>
				              <form:errors path="fname" class="text-danger text-center"/>
				            </div>
				            <div class="form-group">
				              <form:input type="text" path="lname" class="form-control"   value="${item.lname}" placeholder="Last Name"/>
				              <form:errors path="lname" class="text-danger text-center"/>
				            </div>
				            <div class="form-group">
				              <form:input type="hidden" path="id" value="${item.id}"/>
				              <form:input type="email" path="email" class="form-control"  value="${item.email}" placeholder="E-mail" disabled="true"/>
				              <form:errors path="email" class="text-danger text-center"/>
				            </div>            
				            
				            <div class="text-left">
				              <button type="submit" class="btn btn-main">Update</button>
				              <button type="button" class="btn btn-main btn-medium" data-dismiss="modal">Close</button>
				            </div>
				          </form:form>
                            
	                     </div>
					    </div>	
				      </div>
					  </div>
                     
                     </td>
					 </c:if>
					 </tr>
					 </c:forEach>
					 </tbody>
					 
					 </table>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	
</section>



<jsp:include page="footer.jsp"/>

   
    <script>
	    function confirmed(){
            if (confirm('You are about to delete, Do you want to proceed?')) {
                  document.getElementById("del").submit();
                  return true;
	            } else {
	               return false;
	            }
	         }
        	    
	    $("#searchnow").keyup(function () {
	        var value = this.value.toLowerCase().trim();

	        $("table tr").each(function (index) {
	            if (!index) return;
	            $(this).find("td").each(function () {
	                var id = $(this).text().toLowerCase().trim();
	                var not_found = (id.indexOf(value) == -1);
	                $(this).closest('tr').toggle(!not_found);
	                return not_found;
	            });
	        });
	    });
	   
	    </script>
	    	    

  </body>
  </html>

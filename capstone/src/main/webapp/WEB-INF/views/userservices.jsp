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

  <title>Services Posted</title>

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
					<h1 class="page-name">Services Posted</h1> <!-- add "By user name" here -->
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
		     <input type="search" name="keyword" id="searchnow" class="form-control" placeholder="Search Services...">
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
						 <th>
						 Services <i class="oi" data-glyph="wrench"></i> (${list.size()})
		     		     </th>
		     		     <th>Description</th>
					 </tr>
					 <tbody>
						 <c:forEach var="item" items="${list}" >
						 	<tr>
								 <td>${list.indexOf(item)+1}.</td>
								 <c:forEach var="type" items="${serviceType}" >	
								    <c:if test="${type == item.type}">
								 		<td> ${type.id} </td>
								 	</c:if>
								 </c:forEach>
								 <td> ${item.description} </td>
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

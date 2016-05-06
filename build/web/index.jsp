<%-- 
    Document   : index
    Created on : 2015-10-18, 1:09:44
    Author     : KiKo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Navarro's fitness and fighting Gym</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href='css.main/bootstrap.min.css' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <link href='css.main/style.css' rel='stylesheet' type='text/css'>
</head>

<%@include file ="header.jsp" %>

<body>

<div class="jumbotron one">
    
    <div class="col-md-4 col-sm-6 col-xs-12 container_whole">
 	<div class="panel-container">
            <a href="timetables.jsp">
  		<div class="panel_title">Training Schedule</div>
                    <div class="body-panel panel-schedule"></div>
            </a>
  	</div> 
    </div>
    
    
    <div class="col-md-4 col-sm-6 col-xs-12 container_whole">
 	<div class="panel-container">
            <a href="trainers.jsp">
  		<div class="panel_title">Meet the Trainers</div>
                    <div class="body-panel panel-trainers"></div>
            </a>
  	</div> 
    </div>
    
    
</div>
    
  <div class="jumbotron two">
    
    <div class="col-md-6 col-sm-6 col-xs-12 container_whole">
 	<div class="panel-container">
            <a href="membership.jsp">
  		<div class="panel_title">Purchase a monthly membership</div>
                    <div class="body-panel panel-membership"></div>
            </a>
  	</div> 
    </div>
    
    
    <div class="col-md-6 col-sm-6 col-xs-12 container_whole">
 	<div class="panel-container">
            <a href="videos.jsp">
  		<div class="panel_title">Videos Gallery</div>
                    <div class="body-panel panel-register"></div>
            </a>
  	</div> 
    </div>
</div>
 
    
  <div class="jumbotron three">
    <div class="col-md-6 col-sm-6 col-xs-12 container_whole">
 	<div class="panel-container">
            <a href="gallery.jsp">
  		<div class="panel_title">Pictures Gallery</div>
                    <div class="body-panel panel-gallery"></div>
            </a>
  	</div> 
    </div>
    
    
    
    <div class="col-md-6 col-sm-6 col-xs-12 container_whole">
 	<div class="panel-container">
            <a href="shop.jsp">
  		<div class="panel_title">Online shop</div>
                    <div class="body-panel panel-shop"></div>
            </a>
  	</div> 
    </div>
</div>
  

<%@include file ="footer.jsp" %>

</body>
</html>

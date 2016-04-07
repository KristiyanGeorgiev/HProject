<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
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

<%@include file ="header.jsp"%>

  <body class="bodyregister">
      
      <div class='container'>
          <div class='jumbotron register'>
              
              <h2 class='header'>Register for Navarro's Fitness and Fighting Gym</h2>
              
              
              <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>
              
              <form action="RegisterController" method="post" >
                <div class="form-group username">
                    <label>Username:</label>
                    <input type="text" name="username" value="<jsp:getProperty name="user" property="username"/>" class="form-control">
                </div>
                  
                <div class="form-group">
                    <label>First Name:</label>
                    <input type="text" name="firstname" value="<jsp:getProperty name="user" property="firstname"/>" class="form-control">
                </div>
                  
                <div class="form-group">
                    <label>Last Name:</label>
                    <input type="text" name="lastname" value="<jsp:getProperty name="user" property="lastname"/>" class="form-control">
                </div>
                  
                <div class="form-group">
                    <label>Country:</label>
                    <input type="text" name="country" value="<jsp:getProperty name="user" property="country"/>" class="form-control">
                </div>
                  
                <div class="form-group">
                    <label>Email address:</label>
                    <input type="text" name="email" value="<jsp:getProperty name="user" property="email"/>" class="form-control">
                </div>
                  
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" value="<jsp:getProperty name="user" property="password"/>" class="form-control">
                </div>

                  
                <div class="checkbox">
                <label><input type="checkbox">I Agree to the Terms and Conditions</label>
                </div>
                  
                <button type="submit" value="Register" class="btn btn-primary">Register</button>
                
                
                <script>
                    $(document).ready(function(){
                    $('[data-toggle="popover"]').popover();   
                    });
                </script>
</form>
              
          </div>
      </div> 
      
 <%@include file ="footer.jsp"%>   
  </body>
</html>

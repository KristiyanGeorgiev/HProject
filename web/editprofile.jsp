<%-- 
    Document   : editprofile
    Created on : 2016-4-6, 17:14:55
    Author     : KiKo
--%>

<%@page import="java.util.Iterator"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Profile</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <link href='css.main/style.css' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href='css.main/bootstrap.min.css' type='text/css'>          
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

    <body class="bodyprofile">
        <%@include file ="header.jsp"%>
        
        
        <div class='container'>
          <div class='jumbotron register'>
               <div class="panel_title">Update your personal information</div>
              
              
              
              <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>
              
              <form action="ProfileController" method="post" >
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
                    <label>Street Address:</label>
                    <input type="text" name="street" value="<jsp:getProperty name="user" property="street"/>" class="form-control">
                </div>
                
                <div class="form-group">
                    <label>Postcode:</label>
                    <input type="text" name="postcode" value="<jsp:getProperty name="user" property="postcode"/>" class="form-control">
                </div>
                  
                <div class="form-group">
                    <label>Email address:</label>
                    <input type="text" name="email" value="<jsp:getProperty name="user" property="email"/>" class="form-control">
                </div>
                  
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" value="<jsp:getProperty name="user" property="password"/>" class="form-control">
                </div>

        
             <button type="submit" value="UpdateProfile" class="btn btn-primary">Update Profile</button>
                
                
               
</form>
              
          </div>
      </div> 
        
        
        
    
        <%@include file ="footer.jsp"%>                        
    </body> 
</html>

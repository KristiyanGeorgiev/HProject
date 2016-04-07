<%-- 
    Document   : login
    Created on : 2015-11-8, 8:48:41
    Author     : KiKo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <title>Navarro's fitness and fighting Gym</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href='css.main/bootstrap.min.css' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <link href='css.main/style.css' rel='stylesheet' type='text/css'>
</head>

    <%@include file ="header.jsp"%>
    
    <body class="bodylogin">
        
        <div class='container'>
          <div class='jumbotron login'>
              
              <h2 class='header'>Login</h2>
              
              <form method="post" action="LoginController">
                <div class="form-group username">
                    <label for="user">Username:</label>
                    <input type="text" name='uname' value='' class="form-control">
                </div>
                  
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" name='pass' value='' class="form-control">
                </div>
                  
                <div class="checkbox">
                <label>
                <input type="checkbox">Remember me</label>
                </div>
                  
                <button type="submit" value='Login' class="btn btn-primary">Login</button>
              </form>
          </div>
      </div> 
        
       <%@include file ="footer.jsp"%>
    </body>
</html>

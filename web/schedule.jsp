<%-- 
    Document   : schedule
    Created on : 2015-11-10, 11:45:56
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

    <body class="bodyschedule">
    <%@include file ="header.jsp"%>  
    
    <div class='trainer_one_schedule'>   
        <img src='http://www.fightsportsnaples.com/wp-content/uploads/2013/06/a-gym-schedule.jpg'>
    </div>
    
     <div class='trainer_one_button'>  
        <a class="btn btn-primary btns trainer_onebutton" href="trainers.jsp">Go Back</a>
     </div>
    
    <%@include file ="footer.jsp"%>
    </body>
</html>

<%-- 
    Document   : contactus
    Created on : 2015-11-11, 12:13:23
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
    
    <body class='bodycontactus'>
    <%@include file="header.jsp" %>
   
    <div class="banner"></div>
            <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12 contactus">
                
                <p></p>
            </div>
        </div>
    
        <div class="col-md-12" id="ConnectText">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Contact Navarro's fitness and fighting gym</h4>
                    </div>
                    <div class="panel-body">
                        <p> Please feel free to contact Marc below or you call him direct on 07512 928297. All enquiries welcome.
                     
                        <div class="form-group">
                            <label for="name">Full Name:</label>
                            <input name="name" type="text" class="form-control" id="name" maxlength="100" required/>
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail Address:</label>
                            <input name="email" type="email" class="form-control" id="email" maxlength="100" required/>
                        </div>
                        <div class="form-group">
                            <label for="number">Contact Number:</label>
                            <input name="number" type="text" class="form-control" id="number" maxlength="20" required/>
                        </div>
                        <div class="form-group">
                            <label for="message">Message:</label>
                            <textarea name="message" class="form-control" id="message" rows="5" required/></textarea>
                        </div>
                        
                        <div class="g-recaptcha" data-sitekey="6Ld5GQ0TAAAAAJbwITxGPXJfEyfkB2p2b6JjxazP"></div>
                        <br/>
                        <input type="submit" name="op" id="edit-submit" value="Submit" class="btn btn-default">
                </div>
            </div>
    </div>
    
    <%@include file ="footer.jsp" %>
    
    
    </body>
</html>
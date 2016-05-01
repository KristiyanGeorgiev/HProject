<%-- 
    Document   : profile
    Created on : 2016-1-17, 4:49:02
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
  
                
<div class="container profile">
        
    <div class="col-md-8" id="ConnectText">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>My Account Details</strong></h4>
                    </div>
                        <div class="panel-body">
                            <table class="table table-hover">
    
                            
                            <tbody>
                                <tr>
                                    <td>Username:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Firstname:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Lastname:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Country:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Street Address:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Postcode:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Membership:</td>
                                    <td>16/02/2017</td>
                                </tr>
                             </tbody>
            
  </table>
</div>


                </div>
            </div>

<div class="col-md-4" id="ConnectText">
                <div class="panel panel-primary pabout">
                    
                        <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i><strong>Related Pages</strong></h4>
                        </div>
                    
                        <div class="panel-body">
                            <div class="usermenu">
                        
                            <a class="btn btn-primary btns" href="editprofile.jsp">Edit Your Profile</a><br><br>
                            
                            <a class="btn btn-primary btns" href="membership.jsp">Monthly Membership</a><br><br>
                            
                            <a class="btn btn-primary btns" href="paypalpay.jsp">Contact Us</a>
                            
                            </div>
                        </div>

                </div>
        </div>
</div> 
        <%@include file ="footer.jsp"%>                        
    </body> 
</html>

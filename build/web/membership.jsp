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
  
  <script>
      $(document).ready(function(){
        
         $('#membership').change(function(){
           //alert($('#membership').val());
           
           $('#price option').each(function(){
              $( this ).removeAttr("selected");
           });
        
      
         $( "#"+$('#membership').val() ).attr("selected","selected");
        });  
      })
     
      
  </script>
</head>

    <body class="bodyprofile">
        <%@include file ="header.jsp"%>
        
        
        <div class='container'>
          <div class='jumbotron membership'>
               <div class="panel_title">Purchase Monthly Membership</div>
                <div class="body-panel-membership">
                    <form class="form-horizontal" id="multiselectForm" action="AddToCartController"       method="GET">            
                    <input type="hidden" value="1" name="quantity">
                  <div class="form-group">
                    <label class="col-xs-3 control-label">Choose type of trainings:</label>
                        <div class="col-xs-5">
                            <select name="id" class="form-control" id='membership' multiple>
                                <c:forEach items="${allProducts}" var="nextProduct">
                                <option value="${nextProduct.id}" data-id="${nextProduct.id}">${nextProduct.name}</option>
                                </c:forEach>
<!--                                <option value="boxing">Boxing</option>
                                <option value="other">Cardio Workouts</option>
                                <option value="other">Wrestling</option>-->
                            </select>
                        </div>
                </div>
                  
                 <div class="form-group">
                    <label class="col-xs-3 control-label">Gender:</label>
                        <div class="col-xs-5">
                            <select class="form-control" name="gender" multiple>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                </div>
                            
                <div class="form-group">
                    <label class="col-xs-3 control-label">Choose a Plan:</label>
                        <div class="col-xs-5">
                          
                            <select class="form-control" name="id" id='price' multiple>
                                <c:forEach items="${allProducts}" var="nextProduct">
                                    
                                    <option value="price" id="${nextProduct.id}"> ${nextProduct.price}</option>
                                </c:forEach>
<!--                              
                          <option name="price" value="18.99">1 Month 18.99£</option>
                                <option value="49.99">3 Months 49.99£</option>
                                <option value="94.99">6 Months 94.99£</option>
                                <option value="185.99">1 Year 185.99£</option>-->
                            </select>
                         </div>
                </div>

                    <div class="form-group">
                        <div class="col-xs-5 col-xs-offset-3">
                        <form target="paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                            <input type="hidden" name="cmd" value="_s-xclick">
                            <input type="hidden" name="hosted_button_id" value="ZX22GHSKZXASU">
                            <input type="image" src="https://www.sandbox.paypal.com/en_GB/i/btn/btn_cart_LG.gif" name="submit" alt="PayPal ? The safer, easier way to pay online.">
                            <img alt="" border="0" src="https://www.sandbox.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1">
                        </form>
                    </div>
                </div>
        </form>
                
                </div>      
              
          </div>
      </div> 
        
        
        
    
        <%@include file ="footer.jsp"%>                        
    </body> 
</html>

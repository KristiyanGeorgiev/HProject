<%-- 
    Document   : header
    Created on : 2015-11-8, 10:20:47
    Author     : KiKo
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
   <%
    if ((session.getAttribute("is_logged") == null)){
%>


<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div>
      <ul class="nav navbar-nav">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="schedule.jsp">Schedule</a></li>
        <li><a href="trainers.jsp">Trainers</a></li>
        <li><a href="shop.jsp">Online Shop</a></li>
        <li><a href="gallery.jsp">Gallery</a></li>
        <li><a href="contactus.jsp">Contact Us</a></li>
      </ul>
        
        <ul class="nav navbar-nav header_right right_menu">
        <li><a href="register.jsp">Register</a></li>
        <li><a href="log.jsp">Login</a></li>
        </ul>
    </div>
        <%} 
    else {
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div>
<ul class="nav navbar-nav">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="schedule.jsp">Schedule</a></li>
        <li><a href="trainers.jsp">Trainers</a></li>
        <li><a href="ProductsController">Shop</a></li>
        <li><a href="GalleryController">Gallery</a></li>
        <li><a href="contactus.jsp">Contact Us</a></li>
        
         
 
<c:if test='${user == "Admin"}'>
        <li>
            <a class="dropdown" data-toggle="dropdown">Admin<span class="caret"></span></a> 
                <ul class="dropdown-menu">
                    <li><a href="AdminFormController">Shop Management</a></li>
                    <li><a href="AdminGalleryController">Gallery Management</a></li>
                    <li><a href="AdminEditUsersController">Delete/Edit Users</a></li>
                </ul>            
        </li>
</c:if>
</ul>
        
        
<ul class="nav navbar-nav header_right">
    <li><a href="ViewCartController"><img src="Pictures/cart-button.png"/>  (items:${fn:length(cart)})</a>  </li>
        <li><a href="ProfileController">Profile</a></li>
        <li><a href="logout.jsp">Logout</a></li>       
</ul>
  
        
            <div class="welcome_user">
                Welcome ${user}
            </div>
         
<%
    }
%> 
    </div>
  </div>
</nav>
    
</nav>


<%-- 
    Document   : logout
    Created on : 2016-1-16, 20:44:16
    Author     : KiKo
--%>

<%
session.setAttribute("username", null);
session.setAttribute("cart", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
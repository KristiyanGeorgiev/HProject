<%-- 
    Document   : admin
    Created on : 2016-4-2, 21:24:07
    Author     : KiKo
--%>

<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Delete Users</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
        <link href="http://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css"  rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href='css.main/bootstrap.min.css' type='text/css'>          
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link href='css.main/style.css' rel='stylesheet' type='text/css'>
        <script>
            $(document).ready(function () {
                $("#tableProductsDiv").slideDown("slow");
                $("#tableProducts").DataTable({
                    "order": [[0, "desc"]]
                });
                 
                $("#delete").click(function () {
                    $("#delete").val("delete");
                });


            });
        </script>

    </head>
    <%@include file ="header.jsp"%>
    <body class="bodyadmin">

        <div class='container'>
            <div class='jumbotron login'>
                <div class="panel_title_admin">Delete Users</div>




                <h2 class='header'>Users</h2>
                ${edit}
                <div style="display:none; margin:0 auto;" id="tableProductsDiv">
                    <table id="tableProducts">
                        <thead>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Delete</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="nextUser">
                                <tr>
                            <form action="DeleteUsers" id="upload_image" method="POST"> 
                                <td>${nextUser.username}</td>
                                <input type="hidden" name="username" value="${nextUser.username}">
                                <td>${nextUser.firstname}</td>
                                <td>${nextUser.lastname}</td>
                                <td><button id="delete"  name="delete">delete</button></td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div> 
            </div>    
        </div>  
        <%@include file ="footer.jsp"%>
    </body>
</html>

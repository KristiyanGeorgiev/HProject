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
        <title>TODO supply a title</title>
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
                $("#update").click(function () {
                    $("#update").val("updatee");
                });
                $("#delete").click(function () {
                    $("#delete").val("deletee");
                });


            });
        </script>

    </head>
    <%@include file ="header.jsp"%>
    <body class="bodyadmin">

        <div class='container'>
            <div class='jumbotron login' style="display:table; margin:0 auto;">


                <h2 class='header'>Order: Total £ ${total} </h2>
                ${edit}
                <div style="display:none; margin:0 auto;" id="tableProductsDiv">
                    <table id="tableProducts">
                        <thead>
                        <th>id</th>
                        <th>name</th>
                        <th>price</th>
                        <th>image</th>
                        <th>update</th>

                        </thead>
                        <tbody>
                            <c:forEach items="${allProducts}" var="nextProduct">
                                <tr>

                                    <td>${nextProduct.id}</td>

                                    <td> ${nextProduct.name} </td>

                                    <td>  ${nextProduct.price}  </td>
                                    <td>  <input type="hidden" class="form-control" type="file" name="photo" id="photo" size="50"/><img src="data:image/png;base64,${nextProduct.imgString}"  width="80px"</td>
                                    <td> 
                                        <form action="EditCartController" id="edit_cart"   method="POST"> 
                                            <input type="hidden" name="id" value="${nextProduct.id}">
                                            <button id="delete"  name="delete">delete</button>
                                        </form>
                                    </td>
                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>
                </div> 
            </div>    
        </div>  
        <%@include file ="footer.jsp"%>
    </body>
</html>

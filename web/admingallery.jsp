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

                <h2 class='header'>Upload an Image</h2>
                ${result}

                <form action="AdminGalleryPanelController" id="upload_image"   enctype="multipart/form-data"  method="POST">
                    <div class="form-group">
                        <label for="name" >Name of the image</label>
                        <input class="form-control" type="text" id="name" name = "name">
                    </div>
                    <div class="form-group">
                        <label for="photo">Image:</label>
                        <input class="form-control" type="file" name="photo" id="photo" size="50"/>
                    </div>

                    <div>
                        <button class="btn btn-primary" id="add_image" >Add Image</button>
                    </div>    
                </form>
                <h2 class='header'>Images:</h2>
                ${edit}
                <div style="display:none; margin:0 auto;" id="tableProductsDiv">
                    <table id="tableProducts">
                        <thead>
                        <th>id</th>
                        <th>name</th>
                        <th>image</th>
                        <th>update</th>
                        <th>delete</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${allImages}" var="nextImage">
                                <tr>
                            <form action="AdminGalleryPanelController" id="upload_image"   enctype="multipart/form-data"  method="POST"> 
                                <td>${nextImage.id}</td>
                                <input type="hidden" name="id" value="${nextImage.id}">
                                <td><input type="text" name="name" value="${nextImage.name}"><p style="display: none">${nextImage.name}</p></td>
                                <td>  <input type="hidden" class="form-control" type="file" name="photo" id="photo" size="50"/><img src="data:image/png;base64,${nextImage.imgString}"  width="80px"</td>
                                <td><button id="update"  name="update">update</button></td>
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

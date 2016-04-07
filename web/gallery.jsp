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
                $("#tableImagesDiv").slideDown("slow");

                $("#dec").click(function () {
                    if ($(this).next().val() > 1) {
                        $(this).next().val(parseInt($(this).next().val()) - 1)
                    }
                });

                $("#q div").each(function () {

                    $("div #dec").click(function (e) {
                        e.preventDefault();
                        if ($(this).next().val() > 1) {
                            $(this).next().val(parseInt($(this).next().val()) - 1)
                            breakOut = true;
                            return false;
                        }
                    });
                    $("div #inc").click(function (e) {
                        e.preventDefault();
                        if ($(this).prev().val() < 10) {
                            $(this).prev().val(parseInt($(this).prev().val()) + 1)

                        }

                    });
                    return false;
                });
            });
        </script>

    </head>
    <%@include file ="header.jsp"%>
    <body class="bodyadmin">




        <h2 class='header'>Gallery:</h2>
        ${edit}
        <div style="  display:none; margin:0 auto; background-color: rgba(0,0,0,0.4); width:80%;" id="tableImagesDiv">
            <div style="margin:0 auto;width:1000px">
                <h1  style="text-align: center">${msg} </h1>
                <c:forEach items="${allImages}" var="nextImage">

                    <div style="display: inline-block;padding: 20px; ">
                        <div>
                            <h3>Product: ${nextImage.name}</h3>
                        </div>
                        <div>
                            <img src="data:image/png;base64,${nextImage.imgString}"  style = "width:200px">
                        </div>
                             <input type="hidden" name="id" value="${nextImage.id}">
                    </div>
                </c:forEach>
            </div>

        </div> 

        <%@include file ="footer.jsp"%>
    </body>
</html>

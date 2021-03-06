<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Gallery</title>
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

        <a class="btn btn-primary btns videos_button" href="videos.jsp">Videos Gallery</a><br><br>
        ${edit}
        <div class='gallery_class' id="tableImagesDiv">
            <div id='images_id'>
                <h1  style="text-align: center">${msg} </h1>
                <c:forEach items="${allImages}" var="nextImage">

                    <div class='images_class'>
                        <div class="panel-container-images">
                             <div class="panel_title">${nextImage.name}</div>
                                <div class="body-panel-images">
                                    <div id="gallery_images">
                                        <img src="data:image/png;base64,${nextImage.imgString}">
                                    </div>
                                    <input type="hidden" name="id" value="${nextImage.id}">
                                </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div> 

        <%@include file ="footer.jsp"%>
    </body>
</html>

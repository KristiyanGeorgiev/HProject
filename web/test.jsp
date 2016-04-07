<%-- 
    Document   : test
    Created on : 02.04.2016, 22:51:00
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

        <script src="js/ajaxAdminPage.js"></script>

    </head>
    <body>
        <form action="AdminPanelController" id="upload_product"  >
            <div>
                <label for="name" >Name of the product</label>
                <input type="text" id="name">
            </div>
            <div>
                <label for="price">price</label>
                <input type="text" id="price">
            </div>
            <div>
                <label for="photo"> Product Image:</label>
                <input type="file" name="photo" id="photo" size="50"/>
            </div>

            <div>
                <button type="button"  id="add_product" >Add Product</button>
            </div>    






        </form>
    </body>
</html>

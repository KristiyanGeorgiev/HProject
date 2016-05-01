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
        <title>Online Shop</title>
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
        
        ${edit}
        <div class='shop_class' id="tableProductsDiv">
            <div id='products'>
                <h1 style="text-align: center; margin-top: 1.5em; color:green">${msg} </h1>
                <c:forEach items="${allProducts}" var="nextProduct">

                    <div class='products'>
                        <form action="AddToCartController" id="add_to_cart"     method="GET">
                           <div class="panel-container-items">
                             <div class="panel_title">${nextProduct.name}</div>
                                <div class="body-panel-items">

                                    <div id="shop_images">
                                        <img src="data:image/png;base64,${nextProduct.imgString}">
                                    </div>
                                
                                    <div id="shop_price">
                                        <p>Price : ${nextProduct.price}</p>
                                    </div>
                                
                                    <div id="q">
                                            <label for="quantity">Quantity:</label>
                                        <div>                                    
                                            <a id='dec' href='#'>&#45</a>
                                            <input id="quantity" name="quantity" value="1" readonly="readonly"  style=" text-align: center; background-color:transparent;border:none;margin-top:0px;margin-bottom:0px; width:50px; color:black;    padding: 4px 0px;">
                                            <a id='inc'   href='#'>&#43</a>
                                        </div>
                                    </div>
                                
                                    <input type="hidden" name="id" value="${nextProduct.id}">
                                    <form target="paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                                        <input type="hidden" name="cmd" value="_s-xclick">
                                        <input type="hidden" name="hosted_button_id" value="ZX22GHSKZXASU">
                                        <input type="image" src="https://www.sandbox.paypal.com/en_GB/i/btn/btn_cart_LG.gif" name="submit" alt="PayPal – The safer, easier way to pay online.">
                                        <img alt="" border="0" src="https://www.sandbox.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1">
                                    </form>

                             </div>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>

        </div> 

        <%@include file ="footer.jsp"%>
    </body>
</html>

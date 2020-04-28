<%-- 
    Document   : detail
    Created on : Mar 20, 2019, 10:02:34 PM
    Author     : Hp-Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Page</title>
        <link rel="stylesheet" href="./css/style.css">
         <link rel="stylesheet" href="./css/home.css">
    </head>
    <body>
        <div class="container">
            <%@include file="../content/header.jsp" %>
            <div class="content">
                <div class="left">
                    <div class="wrapper">
                        <div class="product">
                            <div class="item">
                                 <h2>${item.getName()}</h2></a>
                                <div class="contentProduct">
                                    <img  src="${item.getImg()}"/>
                                    <div class="description">
                                        ${item.getFulldescription()}
                                    </div>
                                </div>
                            </div>
                        </div>
                   </div>
                </div> 

                

            </div> <!-- end content-->

            <!--  footer-->
            <%@include file="../content/footer.jsp" %>
        </div>
    </body>
</html>

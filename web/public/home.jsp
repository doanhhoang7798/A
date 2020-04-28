<%-- 
    Document   : home
    Created on : Mar 2, 2019, 11:44:18 PM
    Author     : Hp-Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/home.css">

    </head>
    <body>
        <c:set var="active" value="home"/>
        <%--<jsp:useBean id=""--%>
        <div class="container">
            <%@include file="../content/header.jsp" %>
            
            <div class="content">
                <div class="left">
                    <div class="wrapper">
                        
                            <c:forEach items="${product}" var="item">
                                <%@include file="./product.jsp" %>
                            </c:forEach>
                        <div class="pagger">${pagger}</div>
                    </div>
                </div>


            </div>
<!--end content
footer-->
<%@include file="../content/footer.jsp" %>
        </div>
<!--        end container-->
    </body>
</html>

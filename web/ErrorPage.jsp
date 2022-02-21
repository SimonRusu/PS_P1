<%-- 
    Document   : ErrorPage
    Created on : 18-feb-2022, 16:38:04
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
    </head>
    <body>
        
        <jsp:include page="Header.jsp"></jsp:include>
        <h1>The server can not find the requested page</h1>
    
    </body>
</html>

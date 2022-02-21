<%-- 
    Document   : Header
    Created on : 18-feb-2022, 14:20:49
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div id="header">
    <div class="home">
        <a href="${pageContext.request.contextPath}/HomePage.jsp">
        <img id="icon" src="${pageContext.request.contextPath}/resources/home.svg"   alt="home icon"></a>
    </div>
    
    <div><p id="text" >MINI-TIENDA ONLINE</p></div>
    
    <div>
        <a href="${pageContext.request.contextPath}/CartPage.jsp">
            <img id="icon" src="${pageContext.request.contextPath}/resources/shopping-cart.svg"   alt="shopping cart icon">
        </a>
    </div>
</div>

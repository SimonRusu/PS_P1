<%-- 
    Document   : SummaryPage
    Created on : 18-feb-2022, 22:47:49
    Author     : Simon
--%>

<%@page import="Model.Catalogue"%>
<%@page import="Model.Product"%>
<%@page import="Model.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    Object total = request.getAttribute("price"); %>
<%    Object igicTotal = request.getAttribute("igicPrice"); %>
<% ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingCart");%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
    </head>
    <body>
        
        <jsp:include page="Header.jsp"></jsp:include>
        <h1>Purchase summary</h1>
        <table class="tableSummary">

            <tr>
                <th>Book</th>
                <th>Price</th>
                <th>Amount</th>
                <th>Total</th>
            </tr>

            <% for (int id : cart.getCart().keySet()) { %>
            <% Product p = Catalogue.getInstance().findProduct(id); %> 


                <tr>
                    <td style="text-align:center">
                        <img src="<%= p.getImage() %>" width="150" height="250"/>
                    </td>
                    <td><%= p.getPrice() %> €</td>
                    <td>x<%= cart.getCart().get(id) %></td>
                    <td><%= (double) Math.round(p.getPrice()*cart.getCart().get(id) * 100d)/100d %> €</td>
                </tr>          
            <% } %>
        </table>
        <div class="price">Total: <%= total %>€</div>
        <div class="price">Total + IGIG: <%= igicTotal %>€ </div>
        <br>
        <div id="buttons">
            <form action="FrontServlet" method="GET">
                <input type="hidden" value="ClearCart" name="command"/>
                <input class="submitButton" type="submit" value="Finish your purchase"/>
            </form>
        </div>
    
    </body>
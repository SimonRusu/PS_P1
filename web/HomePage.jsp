<%-- 
    Document   : index
    Created on : 17-feb-2022, 18:52:57
    Author     : Simon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Catalogue"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Data.JsonManager"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
    </head>
    <body>
        
    <jsp:include page="Header.jsp"></jsp:include>
    
    <% 
       JsonManager json = new JsonManager(); 
    %>
        
        <table id="table">
            <% for(Product p : json.getCatalogue().getCatalogue()) { %>
            <tr>
                <td style="text-align:center">
                    <img src="<%= p.getImage() %>" width="150" height="250"/>
                </td>
                <td>
                    <ul>
                        <li>Title: <%= p.getTitle() %></li>
                        <li>Autor: <%= p.getAutor()%></li>
                        <li>Price: <%= p.getPrice() %> €</li>
                    </ul>
                    
                    <div style="margin-top: 20px; text-align: center">
                        <form action="FrontServlet" method="GET">
                           <input type="hidden" value="<%= p.getId() %>" name="id" />
                           <input type="hidden" value="AddToCart" name="command"/>
                           <input class="submitButton" type="submit" value="Add book to cart"/>
                        </form>
                   </div>
                </td>
            </tr>
            <% } %>
        </table>
    </body>
</html>

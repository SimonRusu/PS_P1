<%-- 
    Document   : CartPage
    Created on : 18-feb-2022, 17:18:58
    Author     : Simon
--%>

<%@page import="Model.Catalogue"%>
<%@page import="Model.Product"%>
<%@page import="Model.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:scriptlet>
    if(session.getAttribute("shoppingCart") == null){ 
               session.setAttribute("shoppingCart", new ShoppingCart());
   }
</jsp:scriptlet>

<% ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingCart");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">        
    </head>
    <body>
        
        <jsp:include page="Header.jsp"></jsp:include>  
        
        <div>
            <h1>Shopping Cart</h1>
            <% if (cart.getCart().size() == 0) { %>
            
            <div class="cart">
                <p class="cart" >Your shopping cart is empty. Add some books to continue.</p>
                <img class="cart" src="${pageContext.request.contextPath}/resources/empty-cart.jpg">
            </div>
            
            <% } else { %>             
                <table id="table">
                    <% for (int id : cart.getCart().keySet()) { %>
                    <% Product p = Catalogue.getInstance().findProduct(id); %> 
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
                                
                                <div class="quantityOptions">
                                    
                                    <form action="FrontServlet" method="GET">
                                        <input type="hidden" value="<%= id %>" name="id" />
                                        <input type="hidden" value="DecreaseValue" name="command"/>
                                        <input class="submitButton" type="submit" value="-"/>
                                    </form>
                                    
                                    <p><%= cart.getCart().get(id) %></p>
                                        
                                    <form action="FrontServlet" method="GET">
                                        <input type="hidden" value="<%= id %>" name="id" />
                                        <input type="hidden" value="IncreaseValue" name="command"/>
                                        <input class="submitButton" type="submit" value="+"/>
                                    </form>
                                         
                                </div>
                                        
                                <div>                                    
                                    <form action="FrontServlet" method="GET">
                                        <input type="hidden" value="<%= id %>" name="id" />
                                        <input type="hidden" value="DeleteFromCart" name="command"/>
                                        <input class="submitButton" type="submit" value="Remove book from cart"/>
                                    </form>  
                                        
                                </div>
                            </td>
                        </tr>          
                    <% } %>
                </table>
                <br>
                <div id="buttons">
                    <div><a href="${pageContext.request.contextPath}/HomePage.jsp"><button  class="submitButton">Buy more books</button></a></div>
                    <br>
                    <form action="FrontServlet" method="GET">
                        <input type="hidden" value="Summary" name="command"/>
                        <input class="submitButton" type="submit" value="Summary"/>
                    </form> 
                </div>

                    
            <% } %> 
        </div>
        
    </body>
</html>
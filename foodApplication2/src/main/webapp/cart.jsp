<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.foodapp.model.Cart" %>
<%@ page import="com.foodapp.model.CartItem" %>
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .cart-item {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .item-details {
            flex-grow: 1;
        }
        .item-name {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 5px;
        }
        .item-price {
            color: #666;
        }
        .item-total {
            font-weight: bold;
            color: #4CAF50;
        }
        .item-actions {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .quantity-control {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 2px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover {
            background-color: #45a049;
        }
        .remove-btn {
            background-color: #f44336;
            width: 100%;
        }
        .remove-btn:hover {
            background-color: #da190b;
        }
        .total-amount {
            font-size: 20px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .action-buttons button {
            padding: 10px 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Cart</h1>
        <%
        Cart cart = (Cart) session.getAttribute("cart");
        int totalAmount = 0;
        if (cart == null || cart.getItems().isEmpty()) {
        %>
            <p>Your cart is empty!</p>
        <%
        } else {
            for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                CartItem item = entry.getValue();
                totalAmount += item.getPrice() * item.getQuantity();
        %>
            <div class="cart-item">
                <div class="item-details">
                    <div class="item-name"><%= item.getName() %></div>
                    <div class="item-price">Price: Rs <%= item.getPrice() %></div>
                    <div class="item-total">Total: Rs <%= item.getPrice() * item.getQuantity() %></div>
                </div>
                <div class="item-actions">
                    <form action="cart" class="quantity-control">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="menuId" value="<%= item.getMenu_id()%>">
                        <button type="submit" name="quantity" value="<%= item.getQuantity() - 1%>">-</button>
                        <span><%= item.getQuantity() %></span>
                        <button type="submit" name="quantity" value="<%= item.getQuantity() + 1%>">+</button>
                    </form>
                    <form action="cart">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="menuId" value="<%= item.getMenu_id()%>">
                        <button type="submit" class="remove-btn">Remove</button>
                    </form>
                </div>
            </div>
        <%
            }
        %>
            <div class="total-amount">Total Amount: Rs <%= totalAmount%></div>
        <%
        }
        String rd = (String)session.getAttribute("rid");
        int rid = Integer.parseInt(rd);
        %>
        <div class="action-buttons">
            <form action="MenuServlet">
                <input type="hidden" name="restaurantId" value="<%=rid%>">
                <button type="submit">Add More Items</button>
            </form>
            <form action="checkout.jsp">
                <button type="submit">Proceed to Checkout</button>
            </form>
        </div>
    </div>
</body>
</html>


































<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="java.util.Map" %>
<%@ page import="com.foodapp.model.Cart" %>
<%@ page import="com.foodapp.model.CartItem" %>
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Cart</title>
</head>
<body>
<%
    Cart cart = (Cart) session.getAttribute("cart");
	int totalAmount=0;	
    if (cart == null || cart.getItems().isEmpty()) {
%>
        <p>Your cart is empty!</p>
<%
    } else {
%>
        <table border="1px solid black">
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Total Price</th>
                    <th>Actions</th>
                    
                </tr>
            </thead>
            <tbody>
           
<%
		
        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
            CartItem item = entry.getValue();
      		
            totalAmount += item.getPrice()* item.getQuantity();
           
           
%>

                <tr>
                    <td><%= item.getName() %></td>
                    <td><%= item.getPrice() %></td>
                    <td><%= item.getPrice() * item.getQuantity() %></td>
                   
                 
                  <% int total=item.getQuantity()*item.getPrice();
                  		session.setAttribute("total",total);
                  %>
                 
                 
                <%--  <td><%= item.getMenu_id() %></td><%= item.getQuantity() -1%>value="increment" </td>
                
                <td>
                
               
               <form action="cart">
               <input type="hidden" name="action" value="update">
                 <input type="hidden"  name="menuId" value="<%= item.getMenu_id()%>">
               <button type ="submit" name="quantity" value= "<%= item.getQuantity() -1%>">-</button>
          		 <span><%= item.getQuantity() %></span> 
               <button type ="submit" name="quantity" value="<%= item.getQuantity() +1%>">+</button>
               </form>
               
               
               <form action="cart" >
               <input type="hidden" name="action" value="remove">
               <input type="hidden"  name="menuId" value="<%= item.getMenu_id()%>">
               <button type="submit">Remove</button>
               </form>
               </td>
             
                </tr>
                
               
                
              
               
<%
        }
%>
            </tbody>
            
        </table>
         
<%
    }
	
   
    
		    String rd =(String)session.getAttribute("rid");
		    int rid=Integer.parseInt(rd );
%>
            <div>
                
                <form action="MenuServlet" >
                	
                	<h3> Total Amount: Rs <%= totalAmount%></h3>
                    <input type="hidden" name="restaurantId" value="<%=rid%>">
                    <button type="submit">ADD MORE ITEMS BASED ON restaurantId</button>
                  
                </form>
                
                <form action="checkout.jsp" >
                 
                    <button type="submit">Proceed to checkout</button>
                </form>
            </div>

</body>
</html>--%>










<%-- <%@ page import="java.util.Map" %>
<%@ page import="com.foodapp.model.Cart" %>
<%@ page import="com.foodapp.model.CartItem" %>
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Cart</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }
</style>
</head>
<body>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null || cart.getItems().isEmpty()) {
%>
    <p>Your cart is empty!</p>
<%
    } else {
        int totalAmount = 0;
%>
        <table>
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Total Price</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
<%
        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
            CartItem item = entry.getValue();
            totalAmount += item.getPrice() * item.getQuantity();
%>
                <tr>
                    <td><%= item.getName() %></td>
                    <td><%= item.getPrice() %></td>
                    <td><%= item.getPrice() * item.getQuantity() %></td>
                    <td>
                    
                    
                    <%-- <form action="Update">
               
               <input type="hidden" name="menuID" value="<%= item.getMenu_id()%>">
               <button type ="submit" name="action" value= "<%= item.getQuantity() -1%>">-</button>
          		 <span><%= item.getQuantity() %></span> 
               <button type ="submit" name="action" value="<%= item.getQuantity() +1%>">+</button>
               </form></td>
                        <form action="Update" >
                            <input type="hidden" name="menuID" value="<%= item.getMenu_id() %>">
                            <button type="submit" name="action" value="decrement">-</button>
                            <span><%= item.getQuantity() %></span>
                            <button type="submit" name="action" value="increment">+</button>
                        </form>
                    </td>
                    <td>
                        <form action="Remove" >
                            <input type="hidden" name="menuID" value="<%= item.getMenu_id() %>">
                            <button type="submit">Remove</button>
                        </form>
                    </td>
                </tr>
<%
        }
%>
            </tbody>
        </table>
        <p><strong>Total Amount: </strong><%= totalAmount %></p>
<%
    }
%>
    <div>
        <form action="MenuServlet" method="get">
            <input type="hidden" name="restaurantId" value="<%= session.getAttribute("rid") %>">
            <button type="submit">Add More Items</button>
        </form>
        <form action="ProceedToCheckout" method="post">
            <button type="submit">Proceed to Checkout</button>
        </form>
    </div>
</body>
</html>--%>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.Map" %>
    <%@ page import="com.foodapp.model.Cart" %>
    <%@ page import="com.foodapp.model.CartItem" %>
    <%@ page import="java.util.*" %>
	<%@ page import="com.foodapp.model.Restaurant" %>
    
    
<  First Code !DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Cart</title>
</head>
<body>
		
		<% Cart cart=(Cart)session.getAttribute("cart");
		
			if(cart==null || cart.getItems().isEmpty()){
				
			}
			else{
				for(Map.Entry<Integer,CartItem> entry:cart.getItems().entrySet()){
					
					CartItem item=entry.getValue();
					int totalAmount = item.getPrice() * item.getQuantity();
					%>
					
		<table border="1px solid black">
		<th>
		<tr>
		<td>Item Name</td>
		<td>price</td>
		<td>Total Price</td>
		
		</tr>
		</th>
		
			<tr>
			
			<td><%=item.getName() %> </td>
			<td><%=item.getPrice() %></td>
			<td><%=item.getPrice() * item.getQuantity() %></td>
			
			
			
			
			</tr>
		
	</table>
							
					<%
				}
			}
			
			
			
		%>
		
		 <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>
		 
		 <% for(Restaurant r:rList){
			
			int restaurantID=r.getRestaurantId();
			out.println(restaurantID);
			
			
			 
		 }
		 %>
		 
		 
			
	
</body>
</html>--%>




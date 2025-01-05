<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 15px;
            width: 300px;
            background-color: #fff;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
        }

        .card-content h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        .card-content p {
            margin: 5px 0;
            color: #555;
        }

        .card-content .price {
            font-size: 16px;
            font-weight: bold;
            color: #009688;
        }

        .card-content .availability {
            font-size: 14px;
            color: #666;
        }

        /* Internal CSS for the form and button */
        form {
            margin-top: 10px;
            text-align: center;
        }

        form button {
            background-color: #28a745; /* Green color */
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form button:hover {
            background-color: #218838; /* Darker green on hover */
        }
    </style>
</head>
<body>

    <% ArrayList<Menu> mList = (ArrayList<Menu>) session.getAttribute("menuList"); %>

    <% for (Menu m : mList) { %>
        <div class="card">
            <img src="<%= m.getImagePath() %>" alt="<%= m.getName() %>">
            <div class="card-content">
                <h3><%= m.getName() %></h3>
                <%-- <p><strong>Menu ID:</strong> <%= m.getMenuId() %></p>--%>
                <%--<p><strong>Restaurant ID:</strong> <%= m.getRestaurantId() %></p>--%>
                <p><strong></strong> <%= m.getDescription() %></p>
                <p class="price"> ₹<%=m.getPrice() %></p>
                <%--<p class="availability">Available: <%= m.isAvailable() ? "Yes" : "No" %></p>--%>
                
                <form action="cart">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="menuId" value="<%=m.getMenuId()%>">
                    <button type="submit" class="ADD TO CART">ADD TO CART</button>
                </form>    
            </div>
        </div>
    <% } %>

</body>
</html>






























<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 15px;
            width: 300px;
            background-color: #fff;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
        }

        .card-content h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        .card-content p {
            margin: 5px 0;
            color: #555;
        }

        .card-content .price {
            font-size: 16px;
            font-weight: bold;
            color: #009688;
        }

        .card-content .availability {
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>

    <% ArrayList<Menu> mList = (ArrayList<Menu>) session.getAttribute("menuList"); %>

    <% for (Menu m : mList) { %>
        <div class="card">
            <img src="<%= m.getImagePath() %>" alt="<%= m.getName() %>">
            <div class="card-content">
                <h3><%= m.getName() %></h3>
                <%-- <p><strong>Menu ID:</strong> <%= m.getMenuId() %></p>--%>
                <%--<p><strong>Restaurant ID:</strong> <%= m.getRestaurantId() %></p>--%>
                <%-- <p><strong></strong> <%= m.getDescription() %></p>--%>
                <%--<p class="price"> ₹<%=m.getPrice() %></p>--%>
                <%--<p class="availability">Available: <%= m.isAvailable() ? "Yes" : "No" %></p>
                
                 <form action="cart">
                      <input type="hidden" name="action" value="add">
                      <input type="hidden" name="menuId" value="<%=m.getMenuId()%>">
                      <button  type="submit" class="ADD TO CART"> ADD TO CART</button>
                      
                      </form>	
            </div>
        </div>
    <% } %>

</body>
</html>--%>















<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #FF6A00; /* Swiggy's orange background color */
        }
        .menu-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
           .menu-card {
            width: calc(33.33% - 14px);
            max-width: 300px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .menu-card-image {
            width: 100%;
            height: 300px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f9f9f9;
        }
        .menu-card-image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        .menu-card-content {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        .menu-card h3 {
            margin: 0 0 10px 0;
            color: #333;
        }
        .menu-card p {
            margin: 5px 0;
            color: #666;
        }
        .menu-card .price {
            font-weight: bold;
            color: #fc8019; /* Matching the background color */
        }
        .menu-card .availability {
            color: #60b246; /* Swiggy's green color for availability */
        }
    </style>
</head>
<body>
    <% ArrayList<Menu> mList=(ArrayList<Menu>)session.getAttribute("menuList"); %>
    
    <div class="menu-container">
        <% for(Menu m : mList) { %>
            <div class="menu-card">
                <div class="menu-card-image">
                    <img src="<%= m.getImagePath() %>" alt="<%= m.getName() %>">
                </div>
                <div class="menu-card-content">
                     <h3><%= m.getName() %></h3>
                    <p><%= m.getDescription() %></p>
                    <p class="price">₹<%= String.format("%.2f", (double)m.getPrice()) %></p>
                    
                    <%-- <p class="availability"><%= m.isAvailable() ? "Available" : "Not Available" %></p>--%>
                    <%-- <p>Menu ID: <%= m.getMenuId() %></p>
                    <p>Restaurant ID: <%= m.getRestaurantId() %></p>
                      
                      
                      <form action="cart">
                      <input type="hidden" name="action" value="add">
                      <input type="hidden" name="menuId" value="<%=m.getMenuId()%>">
                      <button  type="submit" class="ADD TO CART"> ADD TO CART</button>
                      
                      </form>	
                      	
                      
                     
                     
                </div>
            </div>
        <% } %>
    </div>
</body>
</html>--%>
































<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #FF6A00; /* Swiggy's orange background color */
        }
        .menu-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .menu-card {
            width: calc(33.33% - 14px);
            max-width: 250px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        .menu-card-image {
            width: 100%;
            height: 250px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f9f9f9;
        }
        .menu-card-image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        .menu-card-content {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        .menu-card h3 {
            margin: 0 0 10px 0;
            color: #333;
        }
        .menu-card p {
            margin: 5px 0;
            color: #666;
        }
        .menu-card .price {
            font-weight: bold;
            color: #fc8019; /* Matching the background color */
        }
        .menu-card .availability {
            color: #60b246; /* Swiggy's green color for availability */
        }
    </style>
</head>
<body>
    <% ArrayList<Menu> mList=(ArrayList<Menu>)session.getAttribute("menuList"); %>
    
    <div class="menu-container">
        <% for(Menu m : mList) { %>
            <div class="menu-card">
                <div class="menu-card-image">
                    <img src="<%= m.getImagePath() %>" alt="<%= m.getName() %>">
                </div>
                <div class="menu-card-content">
                     <h3><%= m.getName() %></h3>
                    <p><%= m.getDescription() %></p>
                    <p class="price">₹<%= String.format("%.2f", (double)m.getPrice()) %></p>
                    <p class="availability"><%= m.isAvailable() ? "Available" : "Not Available" %></p>
                     <p>Menu ID: <%= m.getMenuId() %></p>
                    <p>Restaurant ID: <%= m.getRestaurantId() %></p>
                </div>
            </div>
        <% } %>
    </div>
</body>
</html>--%>































<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
        }
        .menu-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .menu-card {
            width: calc(33.33% - 14px);
            max-width: 350px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        .menu-card-image {
            width: 100%;
            height: 250px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f9f9f9;
        }
        .menu-card-image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        .menu-card-content {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        .menu-card h3 {
            margin: 0 0 10px 0;
            color: #333;
        }
        .menu-card p {
            margin: 5px 0;
            color: #666;
        }
        .menu-card .price {
            font-weight: bold;
            color: #e44d26;
        }
        .menu-card .availability {
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <% ArrayList<Menu> mList=(ArrayList<Menu>)session.getAttribute("menuList"); %>
    
    <div class="menu-container">
        <% for(Menu m : mList) { %>
            <div class="menu-card">
                <div class="menu-card-image">
                    <img src="<%= m.getImagePath() %>" alt="<%= m.getName() %>">
                </div>
                <div class="menu-card-content">
                    <h3><%= m.getName() %></h3>
                    <p><%= m.getDescription() %></p>
                    <p class="price">$<%= String.format("%.2f", (double)m.getPrice()) %></p>
                    <p class="availability"><%= m.isAvailable() ? "Available" : "Not Available" %></p>
                    <p>Menu ID: <%= m.getMenuId() %></p>
                    <p>Restaurant ID: <%= m.getRestaurantId() %></p>
                </div>
            </div>
        <% } %>
    </div>
</body>
</html>--%>





























 <%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
    
    <%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Menu</title>
</head>
<body>

	<% ArrayList<Menu> mList=(ArrayList<Menu>)session.getAttribute("menuList"); %>
	
	<table border="1px solid black">
		<th>
		<tr>
		 <td>Menu ID</td>
		<td>Restaurant ID</td>
		<td>Item Name</td>
		<td>Description</td>
		<td>Price</td>
		<td>Is Available</td>
		<td> Image Path</td>
		</tr>
		</th>
		
		<% 
		for(Menu m:mList){
				
			%>
			
			<tr>
			
			<td><%= m.getMenuId() %> </td>
			<td><%= m.getRestaurantId() %></td>
			<td><%= m.getName() %></td>
			<td><%= m.getDescription() %></td>
			<td><%= m.getPrice() %></td>
			<td><%= m.isAvailable() %></td>
			<td><%= m.getImagePath() %></td>
			
			
			
			</tr>
			
			<% 
		}
		%>
		
		
	
	</table>
	
	
	
	
</body>
</html>--%>
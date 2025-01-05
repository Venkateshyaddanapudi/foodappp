<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Restaurant" %>
<%@ page import="com.foodapp.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 20px 0;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .card {
            background-color: white;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
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
            margin: 0 0 10px;
            color: #34495e;
            font-size: 22px;
        }

        .card-content p {
            margin: 5px 0;
            color: #7f8c8d;
        }

        .chip {
            display: inline-block;
            padding: 5px 10px;
            font-size: 14px;
            color: white;
            border-radius: 20px;
            margin: 5px 0;
        }

        .cuisine-chip {
            background-color: #3498db; /* Blue background for cuisine */
        }

        .reviews-chip {
            background-color: #2ecc71; /* Green background for reviews */
        }

        span {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #2c3e50;
        }

        <%--.profile-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid #2c3e50;
        }

        .profile-icon img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }--%>

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <% User u = (User) session.getAttribute("u"); %>
    <%-- <div class="profile-icon">
        <img src="path-to-profile-image.jpg" alt="Profile Icon">
    </div>--%>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <a href="MenuServlet?restaurantId=<%=r.getRestaurantId()%>"><img src="<%= r.getImagePath() %>" alt="Restaurant Image"></a>
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>
                        Cuisine: 
                        <span class="chip cuisine-chip"><%= r.getCuisineType() %></span>
                    </p>
                    <p>Delivery Time: <%= r.getDeliveryTime() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>
                        Reviews: 
                        <span class="chip reviews-chip"><%= r.getRatings() %> / 5</span>
                    </p>
                    <%--<p>Availability: <%= r.isActive() ? "Available" : "Unavailable" %></p>--%>
                    <%-- <span>Restaurant ID: <%= r.getRestaurantId() %></span>--%>
                   <%--   <a href="MenuServlet?restaurantId=<%= r.getRestaurantId() %>">View Menu</a>--%>

				<a href="MenuServlet?restaurantId=<%=r.getRestaurantId()%>">
					<button class="view-menu-btn">View Menu</button>
				</a>

				<style>
.view-menu-btn {
	background-color: #28a745; /* Green background */
	color: white; /* White text */
	border: none; /* Remove border */
	padding: 8px 16px; /* Add padding */
	font-size: 14px; /* Set font size */
	font-weight: bold; /* Bold text */
	border-radius: 5px; /* Rounded corners */
	cursor: pointer; /* Pointer cursor on hover */
	transition: background-color 0.3s ease;
}

.view-menu-btn:hover {
	background-color: #218838; /* Darker green on hover */
}

.view-menu-btn:active {
	background-color: #1e7e34; /* Even darker green on click */
}
</style>


			</div>
            </div>
        <%
        }
        %>
    </div>

</body>
</html>











<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Restaurant" %>
<%@ page import="com.foodapp.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 20px 0;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .card {
            background-color: white;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
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
            margin: 0 0 10px;
            color: #34495e;
            font-size: 22px;
        }

        .card-content p {
            margin: 5px 0;
            color: #7f8c8d;
        }

        .chip {
            display: inline-block;
            padding: 5px 10px;
            font-size: 14px;
            color: white;
            border-radius: 20px;
            margin: 5px 0;
        }

        .cuisine-chip {
            background-color: #3498db; /* Blue background for cuisine */
        }

        .reviews-chip {
            background-color: #2ecc71; /* Green background for reviews */
        }

        span {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #2c3e50;
        }

       <%-- .profile-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid #2c3e50;
        }

        .profile-icon img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <% User u = (User) session.getAttribute("u"); %>
    <div class="profile-icon">
        <img src="path-to-profile-image.jpg" alt="Profile Icon">
    </div>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <a href="MenuServlet?restaurantId=<%=r.getRestaurantId()%>"><img src="<%= r.getImagePath() %>" alt="Restaurant Image"></a>
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>
                        Cuisine: 
                        <span class="chip cuisine-chip"><%= r.getCuisineType() %></span>
                    </p>
                    <p>Delivery Time: <%= r.getDeliveryTime() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>
                        Reviews: 
                        <span class="chip reviews-chip"><%= r.getRatings() %> / 5</span>
                    </p>
                    <p>Availability: <%= r.isActive() ? "Available" : "Unavailable" %></p>
                    <%-- <span>Restaurant ID: <%= r.getRestaurantId() %></span>--%>
                   <%--   <a href="MenuServlet?restaurantId=<%= r.getRestaurantId() %>">View Menu</a>

				<a href="MenuServlet?restaurantId=<%=r.getRestaurantId()%>">
					<button class="view-menu-btn">View Menu</button>
				</a>

				<style>
.view-menu-btn {
	background-color: #28a745; /* Green background */
	color: white; /* White text */
	border: none; /* Remove border */
	padding: 8px 16px; /* Add padding */
	font-size: 14px; /* Set font size */
	font-weight: bold; /* Bold text */
	border-radius: 5px; /* Rounded corners */
	cursor: pointer; /* Pointer cursor on hover */
	transition: background-color 0.3s ease;
}

.view-menu-btn:hover {
	background-color: #218838; /* Darker green on hover */
}

.view-menu-btn:active {
	background-color: #1e7e34; /* Even darker green on click */
}
</style>


			</div>
            </div>
        <%
        }
        %>
    </div>

</body>
</html>--%>
















<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Restaurant" %>
<%@ page import="com.foodapp.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: red;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 20px 0;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .card {
            background-color: white;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
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
            margin: 0 0 10px;
            color: #34495e;
            font-size: 22px;
        }

        .card-content p {
            margin: 5px 0;
            color: #7f8c8d;
        }

        .chip {
            display: inline-block;
            padding: 5px 10px;
            font-size: 14px;
            color: white;
            border-radius: 20px;
            margin: 5px 0;
        }

        .cuisine-chip {
            background-color: #3498db; /* Blue background for cuisine */
        }

        .reviews-chip {
            background-color: #2ecc71; /* Green background for reviews */
        }

        span {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #2c3e50;
        }

        .profile-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid #2c3e50;
        }

        .profile-icon img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <% User u = (User) session.getAttribute("u"); %>
    <div class="profile-icon">
        <img src="path-to-profile-image.jpg" alt="Profile Icon">
    </div>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <img src="<%= r.getImagePath() %>" alt="Restaurant Image">
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>
                        Cuisine: 
                        <span class="chip cuisine-chip"><%= r.getCuisineType() %></span>
                    </p>
                    <p>Delivery Time: <%= r.getDeliveryTime() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>
                        *Reviews: 
                        <span class="chip reviews-chip"><%= r.getRatings() %> / 5</span>
                    </p>
                    <p>Availability: <%= r.isActive() ? "Available" : "Unavailable" %></p>
                    <span>Restaurant ID: <%= r.getRestaurantId() %></span>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>--%>
















<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Restaurant" %>
<%@ page import="com.foodapp.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 20px 0;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .card {
            background-color: white;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
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
            margin: 0 0 10px;
            color: #34495e;
            font-size: 22px;
        }

        .card-content p {
            margin: 5px 0;
            color: #7f8c8d;
        }

        .card-content .chip {
            display: inline-block;
            padding: 5px 10px;
            font-size: 14px;
            color: white;
            background-color: #3498db;
            border-radius: 20px;
            margin-right: 5px;
        }

        .card-content .reviews {
            color: red;
            font-weight: bold;
        }

        .card-content span {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #2c3e50;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <img src="<%= r.getImagePath() %>" alt="Restaurant Image">
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>
                        Cuisine: 
                        <span class="chip"><%= r.getCuisineType() %></span>
                    </p>
                    <p>Delivery Time: <%= r.getDeliveryTime() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p class="reviews">Reviews: <%= r.getRatings() %> / 5</p>
                    <p>Availability: <%= r.isActive() ? "Available" : "Unavailable" %></p>
                    <span>Restaurant ID: <%= r.getRestaurantId() %></span>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>--%>























<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.foodapp.model.Restaurant" %>
<%@ page import="com.foodapp.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 20px 0;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .card {
            background-color: white;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
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
            margin: 0 0 10px;
            color: #34495e;
            font-size: 22px;
        }

        .card-content p {
            margin: 5px 0;
            color: #7f8c8d;
        }

        .card-content span {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #2c3e50;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <% User u = (User) session.getAttribute("u"); %>
    <h1>Welcome, <%= u.getUsername() %>!</h1>

    <% ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList"); %>

    <div class="container">
        <% for (Restaurant r : rList) { %>
            <div class="card">
                <img src="<%= r.getImagePath() %>" alt="Restaurant Image">
                <div class="card-content">
                    <h3><%= r.getName() %></h3>
                    <p>Cuisine: <%= r.getCuisineType() %></p>
                    <p>Delivery Time: <%= r.getDeliveryTime() %> mins</p>
                    <p>Address: <%= r.getAddress() %></p>
                    <p>Reviews: <%= r.getRatings() %> / 5</p>
                    <p>Availability: <%= r.isActive() ? "Available" : "Unavailable" %></p>
                    <span>Restaurant ID: <%= r.getRestaurantId() %></span>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>--%>

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 <%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
	  
			<%User u =(User)session.getAttribute("u");%>
			<h1> Hello  <%= u.getUsername() %></h1>
			
	
	<% ArrayList<Restaurant> rList=(ArrayList<Restaurant>)session.getAttribute("restaurantList"); %>
		
	
	<table border="1px solid black">
		<th>
		<tr>
		<td>Restaurant ID</td>
		<td>Restaurant Name</td>
		<td>Cuisine Type</td>
		<td>Delivery Time</td>
		<td>Address</td>
		<td>Reviews</td>
		<td>Is Available</td>
		<td> Restaurant Path</td>
		</tr>
		</th>
		
		<% 
		for(Restaurant r:rList){
				
			%>
			
			<tr>
			
			<td><%= r.getRestaurantId() %> </td>
			<td><%= r.getName() %></td>
			<td><%= r.getCuisineType() %></td>
			<td><%= r.getDeliveryTime() %></td>
			<td><%= r.getAddress() %></td>
			<td><%= r.getRatings() %></td>
			<td><%= r.isActive() %></td>
			<td><%= r.getImagePath() %></td>
			
			
			</tr>
			
			<% 
		}
		%>
		
		
	
	</table>
	
</body>
</html>--%>
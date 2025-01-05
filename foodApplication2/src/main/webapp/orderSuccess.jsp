<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: ffffff;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            text-align: center;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            border: 3px solid #00796b;
        }

        h1 {
            color: #00796b;
            font-size: 2.5em;
        }

        .confirmation-message {
            margin-top: 20px;
            font-size: 1.2em;
            color: #004d40;
        }

        .bike {
            width: 120px;
            position: relative;
            margin: 50px auto;
        }

        @keyframes bike-move {
            0% { left: 0; }
            100% { left: 100%; }
        }

        .bike img {
            position: relative;
            animation: bike-move 1s ease-in-out infinite;
        }

        /* Styling for a bike path effect */
        .bike-path {
            width: 100%;
            height: 5px;
            background-color: #004d40;
            position: absolute;
            top: 20px;
            left: 0;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #00796b;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1.1em;
            margin-top: 30px;
        }

        .btn:hover {
            background-color: #004d40;
        }
    </style>
</head>
<body>
    <div class="container">
    	<h1>&#10003</h1>
        <h1>Thank You for Your Order!</h1>
        <p class="confirmation-message">Your order has been confirmed. You will receive an Message with the details shortly.</p>

        <!-- Bike Animation -->
        <div class="bike">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa1TU8ICTPFVLJa2XPtSRNPnfW6RYPrnD9uA&s" alt="Bike Image">
            <div class="bike-path"></div> <!-- Optional path for visual effect -->
        </div>
	</div>

    <script>
        // This script controls the movement of the bike image
        document.addEventListener('DOMContentLoaded', function() {
            const bike = document.querySelector('.bike img');
            bike.style.animation = "bike-move 1s ease-in-out infinite";
        });
    </script>
</body>
</html>





















<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
</head>
<body>
	<h3>Order Placed SuccessFully</h3>
</body>
</html>--%>
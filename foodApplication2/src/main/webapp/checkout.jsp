
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f0f4f8, #d9e4ec);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        form {
            background-color: #ffffff;
            width: 100%;
            max-width: 600px;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 30px;
            transition: all 0.3s ease-in-out;
        }

        form:hover {
            transform: scale(1.02);
        }

        h2 {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            font-weight: 600;
            color: #555;
            margin-bottom: 8px;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 14px;
            color: #333;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.5);
        }

        button {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            padding: 14px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        button:active {
            background-color: #388e3c;
        }

        .input-group {
            display: flex;
            flex-direction: column;
        }

        @media (max-width: 600px) {
            form {
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }

            button {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <form action="checkout">
        <h2>Checkout</h2>

        <!-- Full Name -->
        <div class="input-group">
			<label for="fullName">Full Name:</label> <input type="text"
			id="fullName" name="fullName"> <br>
        </div>

        <!-- Phone Number -->
        <div class="input-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="tel" id="phoneNumber" name="phoneNumber"  >
        </div>

        <!-- Address Line  -->
        <div class="input-group">
            <label for="addressLine">Address Line :</label>
            <input type="text" id="addressLine" name="addressLine">
        </div>

        <!-- Landmark -->
        <div class="input-group">
            <label for="landmark">Landmark:</label>
            <input type="text" id="landmark" name="landmark">
        </div>

        <!-- City -->
        <div class="input-group">
            <label for="city">City:</label>
            <input type="text" id="city" name="city" >
        </div>

        <!-- State -->
        <div class="input-group">
            <label for="state">State:</label>
            <input type="text" id="state" name="state" >
        </div>

        <!-- Postal/ZIP Code -->
        <div class="input-group">
            <label for="postalCode">Postal/ZIP Code:</label>
            <input type="text" id="postalCode" name="postalCode"  >
        </div>

        <!-- Country -->
        <div class="input-group">
            <label for="country">Country:</label>
            <input type="text" id="country" name="country" value="India" readonly>
        </div>

        <!-- Payment Method -->
        <div class="input-group">
            <label for="PaymentMethod">Payment Method:</label>
            <select name="PaymentMethod" id="PaymentMethod" required>
                <option value="CreditCard">Credit Card</option>
                <option value="DebitCard">Debit Card</option>
                <option value="UPI">UPI</option>
                <option value="CashOnDelivery">Cash On Delivery</option>
            </select>
        </div>

        <!-- Submit Button -->
        <button type="submit">Place Order</button>
    </form>
</body>
</html>
























<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[readonly] {
            background-color: #e9ecef;
        }
        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg fill="black" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
            background-repeat: no-repeat;
            background-position-x: 98%;
            background-position-y: 50%;
        }
        button {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #2980b9;
        }
        @media (max-width: 480px) {
            body {
                padding: 10px;
            }
            form {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <h2>Checkout</h2>
    <form action="checkout">
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required>

        <label for="phoneNumber">Phone Number:</label>
        <input type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}" required>

        <label for="addressLine1">Address Line 1:</label>
        <input type="text" id="addressLine1" name="addressLine1" required>

        <label for="landmark">Landmark:</label>
        <input type="text" id="landmark" name="landmark">

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>

        <label for="state">State:</label>
        <input type="text" id="state" name="state" required>

        <label for="postalCode">Postal/ZIP Code:</label>
        <input type="text" id="postalCode" name="postalCode" pattern="[0-9]{6}" required>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" value="India" readonly>

        <label for="PaymentMethod">Payment Method:</label>
        <select name="PaymentMethod" id="PaymentMethod">
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="UPI">UPI</option>
            <option value="Cash On Delivery">Cash On Delivery</option>
        </select>

        <button type="submit">Place Order</button>
    </form>
</body>
</html>--%>




















<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            width: 100%;
            max-width: 500px;
            padding: 20px;
        }
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }
        form {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #34495e;
        }
        input[type="text"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #bdc3c7;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="tel"]:focus,
        select:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        input[readonly] {
            background-color: #ecf0f1;
            color: #7f8c8d;
        }
        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
            background-repeat: no-repeat;
            background-position: right 12px top 50%;
            background-size: 12px auto;
        }
        button {
            display: block;
            width: 100%;
            padding: 14px;
            background-color: #3498db;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.1s ease;
        }
        button:hover {
            background-color: #2980b9;
        }
        button:active {
            transform: scale(0.98);
        }
        @media (max-width: 600px) {
            .container {
                padding: 10px;
            }
            form {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Checkout</h2>
        <form action="checkout" method="post">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>

            <label for="phoneNumber">Phone Number:</label>
            <input type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}" required>

            <label for="addressLine1">Address Line 1:</label>
            <input type="text" id="addressLine1" name="addressLine1" required>

            <label for="landmark">Landmark:</label>
            <input type="text" id="landmark" name="landmark">

            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>

            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>

            <label for="postalCode">Postal/ZIP Code:</label>
            <input type="text" id="postalCode" name="postalCode" pattern="[0-9]{6}" required>

            <label for="country">Country:</label>
            <input type="text" id="country" name="country" value="India" readonly>

            <label for="paymentMethod">Payment Method:</label>
            <select id="paymentMethod" name="paymentMethod" required>
                <option value="">Select a payment method</option>
                <option value="creditCard">Credit Card</option>
                <option value="debitCard">Debit Card</option>
                <option value="upi">UPI</option>
                <option value="cashOnDelivery">Cash On Delivery</option>
            </select>

            <button type="submit">Place Order</button>
        </form>
    </div>
</body>
</html>--%>


























<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[readonly] {
            background-color: #e9ecef;
        }
        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
            background-repeat: no-repeat;
            background-position: right 8px top 50%;
            background-size: 12px auto;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #2980b9;
        }
        @media (max-width: 480px) {
            body {
                padding: 10px;
            }
            form {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <h2>Checkout</h2>
    <form action="checkout" method="post">
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required>

        <label for="phoneNumber">Phone Number:</label>
        <input type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}" required>

        <label for="addressLine1">Address Line 1:</label>
        <input type="text" id="addressLine1" name="addressLine1" required>

        <label for="landmark">Landmark:</label>
        <input type="text" id="landmark" name="landmark">

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>

        <label for="state">State:</label>
        <input type="text" id="state" name="state" required>

        <label for="postalCode">Postal/ZIP Code:</label>
        <input type="text" id="postalCode" name="postalCode" pattern="[0-9]{6}" required>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" value="India" readonly>

        <label for="paymentMethod">Payment Method:</label>
        <select id="paymentMethod" name="paymentMethod" required>
            <option value="">Select a payment method</option>
            <option value="creditCard">Credit Card</option>
            <option value="debitCard">Debit Card</option>
            <option value="upi">UPI</option>
            <option value="cashOnDelivery">Cash On Delivery</option>
        </select>

        <button type="submit">Place Order</button>
    </form>
</body>
</html>--%>































<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkout</title>
</head>
<body>
		
	<h2>CheckOut</h2>
	<form action="checkout" >
  
  <label for="fullName">Full Name:</label>
  <input type="text" id="fullName" name="fullName" required>
  <br><br>

  <!-- Phone Number -->
  <label for="phoneNumber">Phone Number:</label>
  <input type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}" required>
  <br><br>

  

  <!-- Address Line 1 -->
  <label for="addressLine1">Address Line 1:</label>
  <input type="text" id="addressLine1" name="addressLine1" required>
  <br><br>

  

  <!-- Landmark -->
  <label for="landmark">Landmark :</label>
  <input type="text" id="landmark" name="landmark">
  <br><br>

  <!-- City -->
  <label for="city">City:</label>
  <input type="text" id="city" name="city" required>
  <br><br>

  <!-- State -->
  <label for="state">State:</label>
  <input type="text" id="state" name="state" required>
  <br><br>

  <!-- Postal/ZIP Code -->
  <label for="postalCode">Postal/ZIP Code:</label>
  <input type="text" id="postalCode" name="postalCode" pattern="[0-9]{6}" required>
  <br><br>

  <!-- Country -->
  <label for="country">Country:</label>
  <input type="text" id="country" name="country" value="India" readonly>
  <br><br>

  

  <!-- Payment Method -->
  <br><label>Payment Method:</label> <select name="PaymentMethod">
  <option value="Online">Credit Card</option>
  <option value="Online">Debit Card</option>
  <option value="Online">UPI</option>
  <option value="Online">Cash On Delivery</option>
  </select><br>
  
  

  <!-- Submit Button -->
  <button type="submit">Place Order</button>
</form>
</body>
</html>--%>
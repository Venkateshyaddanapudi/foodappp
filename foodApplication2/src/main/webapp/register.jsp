<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    form {
        background: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        width: 300px;
    }
    form input[type="text"],
    form input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }
    form input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        color: #fff;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    form input[type="submit"]:hover {
        background-color: #0056b3;
    }
    form label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }
</style>
</head>
<body>
    <form action="Register">
        <label for="username">Username</label>
        <input type="text" name="username" id="username" autocomplete="new-password"><br>
        <label for="password">Password</label>
        <input type="password" name="password" id="password" autocomplete="new-password"><br>
        <label for="cpassword">Confirm Password</label>
        <input type="password" name="cpassword" id="cpassword"><br>
        <label for="email">Email</label>
        <input type="text" name="email" id="email"><br>
        <label for="address">Address</label>
        <input type="text" name="address" id="address"><br>
        <input type="submit" value="Register">
       <p> If you have already account login here<a href="login.jsp"> Login here</a>  </p>
    </form>
</body>
</html>













<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="Register">
	username <input type="text" name="username"><br>
	password<input type="password" name="password"><br>
	confirm password<input type="password" name="cpassword"><br>
	email<input type="text" name="email"><br>
	address<input type="text" name="address"><br>
	<input type="submit" value="register">
	</form>

</body>
</html>--%>
package com.food.controler;

import java.io.IOException;




import com.foodapp.impl.UserDaoImpl;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

 


@WebServlet("/Register")
public class Register extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserDaoImpl udaoi;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String password=req.getParameter("password");
		if(password.equals(req.getParameter("cpassword"))) 
		{
			String username=req.getParameter("username");
			String email=req.getParameter("email");
			String address=req.getParameter("address");
			
			udaoi=new UserDaoImpl();
			int x=udaoi.insert(new User(username,password,email,address));
			if(x==1) {
				resp.sendRedirect("login.jsp");
			}
			else {
				resp.sendRedirect("failure.jsp");
			}
	
		}
		else 
		{
			resp.getWriter().println("password mismatch");
		}
		
		
	}
	
}

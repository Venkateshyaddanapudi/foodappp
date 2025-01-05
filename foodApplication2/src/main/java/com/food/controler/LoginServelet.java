package com.food.controler;

import java.io.IOException;




import com.foodapp.impl.UserDaoImpl;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServelet")
public class LoginServelet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private UserDaoImpl udaoi;
	private User u;
	
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		
		
		HttpSession session =req.getSession();
		
	
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		
		udaoi=new UserDaoImpl();
		u = udaoi.fetch(email);
		System.out.println(u);
		
		Cookie ck=new Cookie("email",email);
		resp.addCookie(ck);
		
		session.setAttribute("u",u );
		req.getRequestDispatcher("GetAllRestaurants").forward(req,resp);
		
		
	}
	

}

package com.food.controler;

import java.io.IOException;



import java.util.ArrayList;

import com.foodapp.impl.RestaurantDaoImpl;
import com.foodapp.interfaces.RestaurantDao;
import com.foodapp.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/GetAllRestaurants")
public class GetAllRestaurants extends HttpServlet
{
	
	private static final long serialVersionUID = 1L;
	private ArrayList<Restaurant> restaurantList;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		//Cookie[] cookies =req.getCookies() ;
		
		
		if(req.getCookies()[0].getValue()!=null) {  //instead of cookies[0]  write req.getCookies()[0]
			
			
			RestaurantDao rdao=new RestaurantDaoImpl();
			restaurantList=rdao.fetchAll();
			
			//System.out.println(restaurantList);
			
			HttpSession session = req.getSession();
			session.setAttribute("restaurantList", restaurantList);
			
			resp.sendRedirect("home.jsp");
			
			
			
			
			
			
		}
		else {
			resp.sendRedirect("login.jsp");
		}
	}


}

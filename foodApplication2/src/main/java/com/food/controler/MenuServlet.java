package com.food.controler;

import java.io.IOException;



import java.util.ArrayList;

import com.foodapp.impl.MenuDaoImpl;
import com.foodapp.interfaces.MenuDao;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;




@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Menu> menuList;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		MenuDao mdao=new MenuDaoImpl();
		
		int rid=Integer.parseInt(req.getParameter("restaurantId"));
		//System.out.println(rid);
		session.setAttribute("rid",req.getParameter("restaurantId"));
		
		
		//System.out.println(id);
		
		menuList=mdao.fetchMenuByRestaurantId(rid);
		
		System.out.println(menuList);
		
		
		

		
		
		session.setAttribute("menuList", menuList);
		resp.sendRedirect("Menu.jsp");
		
		
		
		
		
		
	}

    

}

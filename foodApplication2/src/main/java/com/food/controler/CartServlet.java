package com.food.controler;


import java.io.IOException;





import com.foodapp.impl.MenuDaoImpl;
import com.foodapp.interfaces.MenuDao;
import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		//		STEP-1: get the session for the cart

		HttpSession session=req.getSession();
		Cart cart=(Cart)session.getAttribute("cart");


		//		STEP -2: check if the cart exist or not (if not create one)

		if(cart==null) {
			cart=new Cart();
			session.setAttribute("cart", cart);
		}

		//		STEP -3: fetch the request parameters

		String action=req.getParameter("action");
		System.out.println(action);

		//String menuId=req.getParameter("menuId");


		int menuId=Integer.parseInt(req.getParameter("menuId"));
		System.out.println(menuId);


		//		STEP -4: create a object of MenuDao (for fetching the details of menuItem)


		MenuDao menuDao=null; 

		try {


			menuDao=new MenuDaoImpl();
		}
		catch( Exception   e) {

			e.printStackTrace();
		}

		try {
			if(action.equals("add")) {
				Menu menuItem=menuDao.fetchOne(menuId);
				if(menuItem!=null) {

					//				Step-5:check if the item has added to the  cart based on the Condition

					int quantity=1;  //Default Quantity 1

					CartItem cartItem=new CartItem(
							menuItem.getMenuId(),
							menuItem.getRestaurantId(),
							menuItem.getName(),
							quantity,
							menuItem.getPrice()
							);
					cart.addItem(cartItem);
					//System.out.println(cartItem);
				}

			}	
			else if(action.equals("remove")) {

				cart.removeItem(menuId);

			}

			else if(action.equals("update")) {

				int quantity=Integer.parseInt(req.getParameter("quantity"));
				System.out.println(quantity);
				cart.updateItem(menuId, quantity);

			}


		}
		catch(Exception e) {
			e.printStackTrace();
		}


		//				STEP-6: Redirect TO CART PAGE

		session.setAttribute("cart", cart);
		resp.sendRedirect("cart.jsp");				

	}






}













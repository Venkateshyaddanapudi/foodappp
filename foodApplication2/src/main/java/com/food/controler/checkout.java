package com.food.controler;

import java.io.IOException;



import java.util.Map.Entry;
import java.util.Set;

import com.foodapp.impl.OrderItemsDaoImpl;
import com.foodapp.impl.OrdersDaoImpl;
import com.foodapp.interfaces.OrderItemsDao;
import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.OrderItems;
import com.foodapp.model.Orders;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrdersDaoImpl OrdersDao;
	private OrderItemsDaoImpl OrderItems;



	public void init() {

		try {
			OrdersDao=new OrdersDaoImpl();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void in() {
		
		try {
			
			OrderItems=new OrderItemsDaoImpl();
				
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}






	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {


		HttpSession session=req.getSession();

		Cart cart=(Cart) session.getAttribute("cart");
		User user=(User) session.getAttribute("u");

//		System.out.println(cart);
//		System.out.println(user);


		if(cart !=null && user !=null && !cart.getItems().isEmpty()) {


			//Extract checkout from data
			String paymentMethod= req.getParameter("PaymentMethod");
			System.out.println( paymentMethod);
//			create and populate order object

			Orders orders=new Orders();
			orders.setUserId(user.getUserId());
			System.out.println(user.getUserId());


			String rd =(String)session.getAttribute("rid");
			int rid=Integer.parseInt(rd );
			System.out.println(rid);
			orders.setRestaurantId(rid);
			
			
//			Add cart items to the order and calculate total amount

			int totalAmount =0;
			for(CartItem item:cart.getItems().values()) {
				totalAmount +=item.getPrice() *item.getQuantity();
			}
			orders.setTotalAmount(totalAmount);
			System.out.println(totalAmount);
			orders.setStatus("Pending");
			orders.setPaymentMode(paymentMethod);
			System.out.println(paymentMethod);


// save the order to the database
			int orderId = OrdersDao.insert(orders);
			
			System.out.println("HI");
			
			
			
			
			
			
			
			
			int itemTotalAmount =0;
			int x=0;
			OrderItems orderitem=new OrderItems();
			OrderItemsDao orderitems=new OrderItemsDaoImpl ();
			
			if(cart!=null && !cart.getItems().isEmpty()) {
				
					Set<Entry<Integer,CartItem>> entrySet = cart.getItems().entrySet();
					
					for(Entry<Integer,CartItem> entry : entrySet) {
						itemTotalAmount= entry.getValue().getQuantity() * entry.getValue().getPrice();
						x=orderitems.insert(new OrderItems (orderId,entry.getValue().getMenu_id(),entry.getValue().getQuantity(),itemTotalAmount));
						//totalAmount=0;
						
					}
					if(x!=0) {
						resp.sendRedirect("orderSuccess.jsp");
					}
					else {
						resp.sendRedirect("orderFailure.jsp");
					}
			}


		}

		else {
			resp.sendRedirect("home.jsp");

		}




	}


}

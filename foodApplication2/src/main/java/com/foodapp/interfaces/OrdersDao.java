package com.foodapp.interfaces;

import java.util.ArrayList;


import com.foodapp.model.Orders;

public interface OrdersDao {
	
	int insert(Orders o);
	ArrayList<Orders> fetchAll();
	Orders fetchOne(int orderid);
	int update(int orderid,String status);
	int delete(int orderid);

}

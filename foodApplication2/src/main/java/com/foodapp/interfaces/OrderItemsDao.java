package com.foodapp.interfaces;

import java.util.ArrayList;



import com.foodapp.model.OrderItems;

public interface OrderItemsDao {


	int insert(OrderItems oi);
	ArrayList<OrderItems> fetchAll();
	OrderItems fetchOne(int orderitemid);
	int update(int orderitemid,int itemtotal);
	int delete(int orderitemid);
}

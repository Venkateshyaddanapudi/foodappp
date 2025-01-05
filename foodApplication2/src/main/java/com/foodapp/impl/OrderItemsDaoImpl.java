package com.foodapp.impl;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.dbutil.DBConnection;
import com.foodapp.interfaces.OrderItemsDao;
import com.foodapp.model.OrderItems;

public class OrderItemsDaoImpl implements OrderItemsDao {

	private static ArrayList<OrderItems> orderItemsList=new ArrayList<OrderItems>();
	private static final String INSERT="INSERT INTO ORDERITEMS(orderitemid,orderid,menu_id,quantity,item_total) values(?,?,?,?,?)";
	private static final String FETCHALL="SELECT * FROM  ORDERITEMS";
	private static final String FETCHONE="SELECT * FROM  ORDERITEMS WHERE ORDERITEMID=?";
	private static final String UPDATE="UPDATE ORDERITEMS SET ITEM_TOTAL=? WHERE ORDERITEMID=?";
	private static final String DELETE="DELETE FROM ORDERITEMS WHERE  ORDERITEMID=?";
;	private static Connection con;

	static
	{
		con=DBConnection.coonect();
		
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private OrderItems oi;

	@Override
	public int insert(OrderItems oi) {
		
		try {
			
			pstmt=con.prepareStatement(INSERT);
			pstmt.setInt(1,oi.getOrderItemId());
			pstmt.setInt(2,oi.getOrderId());
			pstmt.setInt(3,oi.getMenuId());
			pstmt.setInt(4,oi.getQuantity());
			pstmt.setInt(5,oi.getItemTotal());
			
			return pstmt.executeUpdate();
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return 0;
	}

	@Override
	public ArrayList<OrderItems> fetchAll() {
		
		try {
			stmt=con.createStatement();
			resultSet=stmt.executeQuery(FETCHALL);
			
			orderItemsList=extractOrderItemsListFromResultSet(resultSet);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return  orderItemsList;
		
		
	}
	
	ArrayList<OrderItems> extractOrderItemsListFromResultSet(ResultSet resultSet){
		
		try {
			
			while(resultSet.next()) {
				
				orderItemsList.add(new OrderItems(
						resultSet.getInt("orderitemid"),
						resultSet.getInt("orderid"),
						resultSet.getInt("menu_id"),
						resultSet.getInt("quantity"),
						resultSet.getInt("item_total")
						)
				
						);
				
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return orderItemsList;
	}

	@Override
	public OrderItems fetchOne(int orderitemid) {
	
		
		try {
			
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, orderitemid);
			
			resultSet=pstmt.executeQuery();
			orderItemsList=extractOrderItemsListFromResultSet(resultSet);
			oi=orderItemsList.get(0);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return oi;
		
	}

	@Override
	public int update(int orderitemid, int itemtotal) {
		
		try {
			
			
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(1, itemtotal);
			pstmt.setInt(2, orderitemid );
			
			return pstmt.executeUpdate();
			
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
		
		
	}

	@Override
	public int delete(int orderitemid) {
		
		
		
		try {
			
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, orderitemid);
			
			return pstmt.executeUpdate();
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	
	}

}

package com.foodapp.impl;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.dbutil.DBConnection;
import com.foodapp.interfaces.OrdersDao;
import com.foodapp.model.Orders;

public class OrdersDaoImpl implements OrdersDao {

	private static ArrayList<Orders> ordersList=new ArrayList<Orders>();
	private static String INSERT="INSERT INTO ORDERS(userid,restaurantid,total_amount,status,paymentmode) values(?,?,?,?,?)";
	private static String FETCHALL="SELECT * FROM ORDERS";
	private static String FETCHONE="SELECT * FROM ORDERS WHERE ORDERID=?";
	private static String UPDATE="UPDATE ORDERS SET STATUS=? WHERE ORDERID=?";
	private static String DELETE="DELETE FROM ORDERS WHERE ORDERID=?";
	private static Connection con;

	static
	{
		con=DBConnection.coonect();
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private Orders o;

	@Override
	public int insert(Orders o) {
		int generatedOrderId=-1;
		
		try {
			
			pstmt=con.prepareStatement(INSERT,Statement.RETURN_GENERATED_KEYS);
			//pstmt.setInt(1, o.getOrderId());
			pstmt.setInt(1, o.getUserId());
			pstmt.setInt(2, o.getRestaurantId());
			pstmt.setInt(3,o.getTotalAmount());
			pstmt.setString(4, o.getStatus());
			pstmt.setString(5, o.getPaymentMode());
			
			
			int res= pstmt.executeUpdate();
			
			if(res>0) {
				try(ResultSet generatedKeys = pstmt.getGeneratedKeys()){
					
					if(generatedKeys.next()) {
						generatedOrderId=generatedKeys.getInt(1);
					}
					
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
			return generatedOrderId;
				
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
		
		
	}

	@Override
	public  ArrayList<Orders> fetchAll() {
		
		try {
			stmt = con.createStatement();
			resultSet = stmt.executeQuery(FETCHALL);
			
			ordersList=extractOrdersListFromResultSet(resultSet);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return  ordersList;
		
		
		
	}
	
	ArrayList<Orders> extractOrdersListFromResultSet(ResultSet resultSet){
		
		try {
			while(resultSet.next()) {
				
				ordersList.add(new Orders(
						/*resultSet.getInt("orderid"),*/
						resultSet.getInt("userid"),
						resultSet.getInt("restaurantid"),
						resultSet.getInt("total_amount"),
						resultSet.getString("status"),
						resultSet.getString("paymentmode")
						)
						);
				
				
				
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return ordersList;
		
	}

	@Override
	public Orders fetchOne(int orderid) {
		
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, orderid);
			
			resultSet=pstmt.executeQuery();
			ordersList=extractOrdersListFromResultSet(resultSet);
			o=ordersList.get(0);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return o;
		
		
	}

	@Override
	public int update(int orderid, String status) {
		
		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setString(1, status);
			pstmt.setInt(2, orderid);
			
			return pstmt.executeUpdate();
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
		
		
		
	}

	@Override
	public int delete(int orderid) {
		
		try {
			
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, orderid);
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	

}

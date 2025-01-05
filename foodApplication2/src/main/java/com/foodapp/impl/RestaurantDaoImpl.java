package com.foodapp.impl;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.dbutil.DBConnection;
import com.foodapp.interfaces.RestaurantDao;
import com.foodapp.model.Restaurant;

public class RestaurantDaoImpl implements RestaurantDao {
	
ArrayList<Restaurant> restaurantList=new ArrayList<Restaurant>();
	
	private static final String INSERT="INSERT INTO RESTAURANT(restaurantid,name,cuisine_type,delivery_time,address,ratings,isActive,imagepath) values(?,?,?,?,?,?,?,?)";
	private static final String FETCHALL="SELECT * FROM RESTAURANT";
	private static final String FETCHONE="SELECT * FROM RESTAURANT WHERE RESTAURANTID=?";
	private static final String UPDATE="UPDATE RESTAURANT SET NAME=? WHERE RESTAURANTID=?";
	private static final String DELETE="DELETE FROM   RESTAURANT WHERE RESTAURANTID=?";
	private static Connection con;

	static 
	{
		con=DBConnection.coonect();
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;

	private Restaurant r;

	@Override
	public int insert(Restaurant r) {
		
		
		try
		{
			pstmt=con.prepareStatement(INSERT);
			
			pstmt.setInt(1, r.getRestaurantId());
			pstmt.setString(2, r.getName());
			pstmt.setString(3, r.getCuisineType());
			pstmt.setInt(4,r.getDeliveryTime());
			pstmt.setString(5, r.getAddress());
			pstmt.setFloat(6, r.getRatings());
			pstmt.setBoolean(7, r.isActive());
			pstmt.setString(8,r.getImagePath());
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) 
		{
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public ArrayList<Restaurant>  fetchAll() {
		try {
			stmt=con.createStatement();
			resultSet=stmt.executeQuery(FETCHALL);
			
			restaurantList =extractRestaurantListFromResultSet(resultSet);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return restaurantList;
	}
	
	ArrayList<Restaurant> extractRestaurantListFromResultSet(ResultSet resultSet){
		
		try {
			while(resultSet.next()) {
				

				restaurantList.add(new Restaurant(resultSet.getInt("restaurantid"),
						resultSet.getString("name"),
						resultSet.getString("cuisine_type"),
						resultSet.getInt("delivery_time"),
						resultSet.getString("address"),
						resultSet.getFloat("ratings"),
						resultSet.getBoolean("isActive"),
						resultSet.getString("imagepath")
						)
						);
				
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return restaurantList;
	}

	@Override
	public Restaurant fetchOne(int rid) {
		
		
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, rid);
			
			resultSet=pstmt.executeQuery();
			restaurantList=extractRestaurantListFromResultSet(resultSet);
			r=restaurantList.get(0);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return r;
		
	}

	@Override
	public int update(int id, String name) {
		
		
		try {
			
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setString(1, name);
			pstmt.setInt(2, id);
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
	}

	@Override
	public int delete(int id) {
		
		try {
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, id);
			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	

	
	

}

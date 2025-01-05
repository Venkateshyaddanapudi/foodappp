package com.foodapp.impl;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.dbutil.DBConnection;
import com.foodapp.interfaces.MenuDao;
import com.foodapp.model.Menu;

public class MenuDaoImpl implements MenuDao {
	
	private   ArrayList<Menu> menuList=new ArrayList<Menu>();
	private static final String INSERT="INSERT INTO MENU(menu_id,restaurant_id,name,description,price,isAvailable,imagePath) values(?,?,?,?,?,?,?)";
	private static final String FETCHALL="SELECT * FROM MENU"; 
	private static final String FETCHONE="SELECT * FROM MENU WHERE MENU_ID=?";
	private static final String UPDATE="UPDATE MENU SET PRICE=? WHERE MENU_ID=?";
	private static final String DELETE="DELETE FROM MENU WHERE MENU_ID=?";
	private static final String FETCHBYRESTID="SELECT * FROM MENU WHERE RESTAURANT_ID=?";
	private static Connection con;

	static 
	{
		
		con=DBConnection.coonect();
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private Menu m;

	@Override
	public int insert(Menu m) {
		
		
		
		try 
		{
			
			 pstmt = con.prepareStatement(INSERT);
			 
			 pstmt.setInt(1, m.getMenuId());
			 pstmt.setInt(2,m.getRestaurantId());
			 pstmt.setString(3, m.getName());
			 pstmt.setString(4,m.getDescription());
			 pstmt.setInt(5, m.getPrice());
			 pstmt.setBoolean(6, m.isAvailable());
			 pstmt.setString(7, m.getImagePath());
			 
			 
			 return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<Menu> fetchAll() {
		
		
		try
		{
			
			stmt=con.createStatement();
			resultSet=stmt.executeQuery(FETCHALL);
			
			menuList=extractMenuListFromResultSet(resultSet);
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return menuList;
	}

	
	ArrayList<Menu> extractMenuListFromResultSet(ResultSet resultSet){
		
		
		try 
		{
			while (resultSet.next()) {

				menuList.add(new Menu(resultSet.getInt("menu_id"), resultSet.getInt("restaurant_id"),
						resultSet.getString("name"), resultSet.getNString("description"), resultSet.getInt("price"),
						resultSet.getBoolean("isAvailable"), resultSet.getString("imagepath")));

			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return menuList;

	}

	@Override
	public Menu fetchOne(int menuid) {
		
		
		try
		{
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, menuid);
			
			resultSet=pstmt.executeQuery();
			menuList=extractMenuListFromResultSet(resultSet);
			m=menuList.get(0);
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return m;
		
	}

	@Override
	public int update(int menuid, int price) {
		
		
		
		
		try 
		{
			
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(1, price);
			pstmt.setInt(2, menuid);
			
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			
			return 0;
		}
		
	}

	@Override
	public int delete(int menuid) {
		
		try 
		{
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, menuid);
			
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			
			return 0;
		}
		
		
	}

	@Override
	public ArrayList<Menu> fetchMenuByRestaurantId(int RESTAURANT_ID) {
		
		try {
			
			pstmt=con.prepareStatement(FETCHBYRESTID);
			pstmt.setInt(1, RESTAURANT_ID);
			
			resultSet=pstmt.executeQuery();
			menuList=extractMenuListFromResultSet(resultSet);
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return menuList;
		
	}	


	
}

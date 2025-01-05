package com.foodapp.impl;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.dbutil.DBConnection;
import com.foodapp.interfaces.UserDao;
import com.foodapp.model.User;

public class UserDaoImpl implements UserDao {
	private static ArrayList<User> userList=new ArrayList<User>();
	private static final String INSERT="INSERT INTO USER(username,password,email,address) values(?,?,?,?)";
	private static final String FETCHALL="SELECT * FROM USER";
	private static final String FETCHONE="SELECT * FROM USER WHERE USERID=?";
	private static final String UPDATE="UPDATE USER SET USERNAME=? WHERE USERID=?";
	private static final String DELETE="DELETE FROM USER WHERE USERID=?";
	private static final String FETCHONEMAIL="SELECT * FROM USER WHERE EMAIL=?";
	private static Connection con;

	static
	{
		con=DBConnection.coonect();
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private User u;

	@Override
	public int insert(User u) {
		
		
		try
		{
			pstmt=con.prepareStatement(INSERT);
			//pstmt.setInt(1, u.getUserId());
			pstmt.setString(1, u.getUsername());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getAddress());
			
			return pstmt.executeUpdate();
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
		
		
		
	}

	@Override
	public  ArrayList<User> fetchAll() {
	
		try 
		{
			stmt=con.createStatement();
			resultSet=stmt.executeQuery(FETCHALL);
			
			userList=extractUserListFromResultSet(resultSet);
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	ArrayList<User> extractUserListFromResultSet(ResultSet resultSet){
		
		
		try {
			
			while(resultSet.next()) {
				
				
				userList.add(new User(resultSet.getInt("userid"),
						resultSet.getString("username"),
						resultSet.getString("password"),
						resultSet.getString("email"),
						resultSet.getString("address")
						)
						);
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public User fetchOne(int id) {
		
		try {
			
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, id);
			
			resultSet=pstmt.executeQuery();
			
			userList=extractUserListFromResultSet(resultSet);
			u=userList.get(0);
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
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
			return 0;
		}
		
		
	}

	@Override
	public User fetch(String email) {
		
		try {
			pstmt=con.prepareStatement(FETCHONEMAIL);
			pstmt.setString(1, email);
			
			resultSet=pstmt.executeQuery();
			
			userList=extractUserListFromResultSet(resultSet);
			u=userList.get(0);
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}

}

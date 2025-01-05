package com.foodapp.interfaces;

import java.util.ArrayList;

import com.foodapp.model.User;

public interface UserDao {
	
	int insert(User u);
	ArrayList<User>  fetchAll();
	User fetchOne(int id);
	int update(int id,String username);
	int delete(int id);
	User fetch(String email);

}

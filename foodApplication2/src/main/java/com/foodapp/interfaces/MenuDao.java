package com.foodapp.interfaces;

import java.util.ArrayList;



import com.foodapp.model.Menu;

public interface MenuDao {
	
	int insert(Menu m);
	ArrayList<Menu> fetchAll();
	Menu fetchOne(int menuid);
	
	int update(int menuid,int price);
	int delete(int menuid);
	ArrayList<Menu> fetchMenuByRestaurantId(int restId);

}

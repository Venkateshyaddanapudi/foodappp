package com.foodapp.interfaces;

import java.util.ArrayList;

import com.foodapp.model.Restaurant;

public interface RestaurantDao {

	int insert(Restaurant r);
	ArrayList<Restaurant> fetchAll();
	Restaurant fetchOne(int id);
	int update(int id,String name);
	int delete(int id);

}

package com.foodapp.model;

public class CartItem {
	
	
	
	private int menu_id;
	private int restaurantid;
	private String name;
	private int quantity;
	private int price;
	
	
	
	public CartItem() {
		super();
	}


	public CartItem( int menu_id, int restaurantid, String name, int quantity, int price) {
		super();
		
		this.menu_id = menu_id;
		this.restaurantid = restaurantid;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
	}
	
	


	public int getMenu_id() {
		return menu_id;
	}


	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}


	public int getRestaurantid() {
		return restaurantid;
	}


	public void setRestaurantid(int restaurantid) {
		this.restaurantid = restaurantid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	@Override
	public String toString() {
		return   menu_id + "  " + restaurantid + "  "
				+ name + "  " + quantity + "  " + price ;
	}


}

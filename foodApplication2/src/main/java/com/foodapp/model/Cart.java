package com.foodapp.model;

import java.util.HashMap;


import java.util.Map;

public class Cart {
	
	
	private Map<Integer,CartItem> items;
	
	public Cart() {
		this.items=new HashMap<>();
	}
	
	public void addItem(CartItem item) {
		
		int menuId=item.getMenu_id();
		if(items.containsKey(menuId))
		{
			CartItem existingItem=items.get(menuId);
			existingItem.setQuantity(existingItem.getQuantity() +item.getQuantity());
		}
		else {
			items.put(menuId, item);
		}
	}
	
	
	
	public void updateItem(int menuId,int quantity){
		
		if(items.containsKey(menuId)) {
			
			if(quantity <=0) {
				items.remove(menuId);
			}
			else {
				CartItem existingItem=items.get(menuId);
				existingItem.setQuantity(quantity);
				
				
				//or
				//items.get(menuId).setQuantity(quantity);
			}
			
		}
	}
	
	
	public void removeItem(int menuId){
		
		items.remove(menuId);
		
	}
	
	
	public void clear(){
		items.clear();
	}
	
	
	public Map<Integer,CartItem> getItems(){
		
		return items;
	}
	
	
	
	

}

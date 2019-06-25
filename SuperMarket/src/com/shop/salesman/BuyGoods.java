package com.shop.salesman;

public interface BuyGoods {
	public abstract void buyadd(String id, String fullNumber);

	public abstract void buydelete(String id);

	public abstract boolean buysale();
}

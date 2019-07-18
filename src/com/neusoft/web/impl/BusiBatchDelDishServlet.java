package com.neusoft.web.impl;

public class BusiBatchDelDishServlet extends BusiControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("busiBatchDelDish", "删除");
		this.saveBusiMenuDataForDelete();
		this.saveBusiDishQueryData();
		this.saveSyscodeInstance();
		return "busiDishQuery";
	}
}

package com.neusoft.web.impl;

public class BusiDelDishByIdServlet extends BusiControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("busiDelDishById", "删除");
		this.saveBusiMenuDataForDelete();
		this.saveBusiDishQueryData();
		this.saveSyscodeInstance();
		return "busiDishQuery";
	}
}

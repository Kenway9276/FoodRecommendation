package com.neusoft.web.impl;

public class BusiToAddDishPageServlet extends BusiControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.saveSyscodeInstance();
		return "busiAddDish";
	}
}

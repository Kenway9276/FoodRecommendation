package com.neusoft.web.impl;

public class BusiFindDishByIdServlet extends BusiControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.busiFindDishById();
		this.saveSyscodeInstance();
		this.busiConvertBusiId();
		return "busiAddDish";
	}
}

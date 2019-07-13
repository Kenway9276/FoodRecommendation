package com.neusoft.web.impl;

public class BusiMenuManageServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.saveSyscodeInstance();
		this.saveBusiMenuInstance();
		return "busiDishQuery";
	}

}

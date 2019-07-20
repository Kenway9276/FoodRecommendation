package com.neusoft.web.impl;

public class BusiQueryServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.saveBusiDishQueryData();
		this.saveSyscodeInstance();
		this.busiConvertBusiId();
		return "busiDishQuery";
	}

}

package com.neusoft.web.impl;

public class BusiModifyDishServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("busiModfyDish", "修改");
		this.saveSyscodeInstance();
		this.saveBusiMenuInstance();
		return "busiDishQuery";
	}

}

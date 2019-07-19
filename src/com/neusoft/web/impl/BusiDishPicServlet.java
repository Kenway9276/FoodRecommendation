package com.neusoft.web.impl;

public class BusiDishPicServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("Address", "saveBusiDishPicAddress");	
		return "busiManageDishPic";	
	}

}

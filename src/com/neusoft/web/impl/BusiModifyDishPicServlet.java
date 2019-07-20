package com.neusoft.web.impl;

public class BusiModifyDishPicServlet extends BusiControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("busiModifyDishPic", "修改");
		this.savePageData("Address", "saveBusiDishPicAddress");	
		this.busiConvertDishId();
		return "busiManageDishPic";	
	}
}

package com.neusoft.web.impl;

public class ShopinfoFindAllServlet extends ShopinfoControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData("rows", "queryAllShop");
		return "shopsearch";		
    }
}

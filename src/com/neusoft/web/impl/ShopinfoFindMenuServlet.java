package com.neusoft.web.impl;

public class ShopinfoFindMenuServlet extends ShopinfoControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		//�˵�
		this.savePageData("menus","queryMenu");
		return "shopmenu";
    }
}

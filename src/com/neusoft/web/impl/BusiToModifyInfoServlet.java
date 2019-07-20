package com.neusoft.web.impl;

public class BusiToModifyInfoServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.busiReturnInfo();
		this.saveMapPageData("Equipment", "saveBusiEquipment");
		return "busiModifyInfo";
	}

}

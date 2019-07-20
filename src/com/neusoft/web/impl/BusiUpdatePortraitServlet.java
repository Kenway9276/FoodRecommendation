package com.neusoft.web.impl;

public class BusiUpdatePortraitServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("busiUpdatePortrait", "修改");
		this.busiReturnInfo();
		this.saveMapPageData("Equipment", "saveBusiEquipment");
		return "busiModifyInfo";
	}

}

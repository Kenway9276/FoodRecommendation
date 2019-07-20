package com.neusoft.web.impl;

public class BusiModifyInfoServlet extends BusiControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("busiModify", "修改");
		this.busiReturnInfo();
		this.saveMapPageData("Equipment", "saveBusiEquipment");
		return "busiModifyInfo";
	}
}

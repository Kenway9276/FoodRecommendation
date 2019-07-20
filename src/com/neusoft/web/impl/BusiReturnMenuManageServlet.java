package com.neusoft.web.impl;

public class BusiReturnMenuManageServlet extends BusiControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.saveSyscodeInstance();
		this.saveBusiMenuInstance();
		this.busiConvertBusiId();
		return "busiDishQuery";
	}

}

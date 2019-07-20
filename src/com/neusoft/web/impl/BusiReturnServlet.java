package com.neusoft.web.impl;

public class BusiReturnServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.busiReturnInfo();
		return "busiModify";
	}

}

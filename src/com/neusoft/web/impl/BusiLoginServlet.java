package com.neusoft.web.impl;

public class BusiLoginServlet extends BusiControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		if(this.saveBusiLoginInstance())
		{
			return "busiModify";
		}
		else
		{
			return "busiLogin";
		}
	}
}

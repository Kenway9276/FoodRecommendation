package com.neusoft.web.impl;

public class BusiLoginServlet extends BusiControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.saveBusiLoginInstance();
		return "busiModify";
	}
}

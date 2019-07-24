package com.neusoft.web.impl;

public class BusiRegisterServlet extends BusiControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.update("busiRegister", "注册");
//		this.update("insertAa06", "注册");
		this.update("insertAb04", "注册");
		return "busiLogin";
	}
}

package com.neusoft.web.impl;

public class UserToAssemblePageServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.saveUserAssembleInstance();
		this.busiConvertBusiId();
		return "userAssemble";
	}

}

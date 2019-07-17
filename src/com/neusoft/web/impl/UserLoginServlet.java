package com.neusoft.web.impl;
public class UserLoginServlet extends UserControllerSupport 
{
	public String execute() throws Exception 
	{
		this.saveUserLoginInstance();
		return "userHistory";
	}
}

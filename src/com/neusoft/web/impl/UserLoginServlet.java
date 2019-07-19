package com.neusoft.web.impl;
public class UserLoginServlet extends UserControllerSupport 
{
	public String execute() throws Exception 
	{
		if(this.saveUserLoginInstance())
		{
			return "userHistory";
		}
		else
		{
			return "userLogin";
		}
	}
}

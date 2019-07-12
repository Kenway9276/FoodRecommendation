package com.neusoft.web.impl;

public class UserModifyServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		update("userModify", "ÐÞ¸Ä");
		return "userRegister";
	}

}

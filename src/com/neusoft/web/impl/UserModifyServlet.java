package com.neusoft.web.impl;

public class UserModifyServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		updatePWD("userModify", "ÐÞ¸Ä");
		return "userLogin";
	}

}

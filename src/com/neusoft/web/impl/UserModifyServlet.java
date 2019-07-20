package com.neusoft.web.impl;

public class UserModifyServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("adminModify", "ÐÞ¸Ä");
		return "userLogin";
	}

}

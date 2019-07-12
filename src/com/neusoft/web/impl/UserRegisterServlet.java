package com.neusoft.web.impl;

public class UserRegisterServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("userRegister", "зЂВс");
		return "userLogin";
	}

}

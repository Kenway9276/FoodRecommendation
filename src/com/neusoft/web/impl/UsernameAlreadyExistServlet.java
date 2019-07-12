package com.neusoft.web.impl;

public class UsernameAlreadyExistServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		update("userNameAlreadyExit","用户名查重");
		return "userRegister";
	}

}

package com.neusoft.web.impl;

public class UserNameCheckServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		update("userNameCheck","用户名查重");
		return "userRegister";
	}

}

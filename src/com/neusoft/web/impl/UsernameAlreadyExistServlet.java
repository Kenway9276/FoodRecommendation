package com.neusoft.web.impl;

public class UsernameAlreadyExistServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		update("userNameAlreadyExit","�û�������");
		return "userRegister";
	}

}

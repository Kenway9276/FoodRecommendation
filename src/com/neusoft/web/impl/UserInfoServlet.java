package com.neusoft.web.impl;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

public class UserInfoServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveUserInfoInstance();
		return "userRegister";
	}

}

package com.neusoft.web.impl;

public class UserAssembleServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveUserAssembleInstance();
		return "userAssemble";
	}

}

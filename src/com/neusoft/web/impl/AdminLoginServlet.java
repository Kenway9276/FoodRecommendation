package com.neusoft.web.impl;

public class AdminLoginServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveAdminLoginInstance();
		return "adminInfo";
	}

}

package com.neusoft.web.impl;

public class AdminInfoServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveadminInfoInstance();
		return "adminInfo";
	}

}

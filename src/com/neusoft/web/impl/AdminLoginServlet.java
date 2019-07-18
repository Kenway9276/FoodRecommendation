package com.neusoft.web.impl;

public class AdminLoginServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		if(this.saveAdminLoginInstance())
		{
			return "adminInfo";
		}
		else
		{
			return "adminLogin";
		}
	}
}

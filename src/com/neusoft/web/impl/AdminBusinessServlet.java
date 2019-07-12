package com.neusoft.web.impl;

public class AdminBusinessServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveAdminBusiPageData();
		return "adminBusiness";
	}

}

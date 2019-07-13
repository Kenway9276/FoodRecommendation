package com.neusoft.web.impl;

public class AdminForumServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveAdminForumPageData();
		return "adminForum";
	}

}

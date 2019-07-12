package com.neusoft.web.impl;

public class UserNoticeServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveUserNoticePageData();
		return "userNotice";
	}

}

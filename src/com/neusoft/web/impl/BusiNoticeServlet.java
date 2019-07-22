package com.neusoft.web.impl;

public class BusiNoticeServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveUserNoticePageData();
		return "busiNotice";
	}
}

package com.neusoft.web.impl;

public class AdminNoticeServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveNoticePageData();
		return "adminNotice";
	}

}

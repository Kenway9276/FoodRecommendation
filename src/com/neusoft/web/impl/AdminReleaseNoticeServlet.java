package com.neusoft.web.impl;

public class AdminReleaseNoticeServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		update("adminReleaseNotice", "·¢²¼");
		return "adminNotice";
	}

}

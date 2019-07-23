package com.neusoft.web.impl;

public class FindByIdNoticeServlet extends UserControllerSupport {
	@Override
	public String execute() throws Exception {
		this.saveNoticeInstance();
		return "userNoticeInfo";
	}
}

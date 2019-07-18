package com.neusoft.web.impl;

public class AdminBeforeNoticeModifyServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveNoticeInstance();
		return "adminReleaseNotice";
	}

}

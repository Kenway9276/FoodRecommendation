package com.neusoft.web.impl;

public class AdminNoticeModifyServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		update("adminNoticeModify", "ÐÞ¸Ä");
		return "adminNotice";
	}

}

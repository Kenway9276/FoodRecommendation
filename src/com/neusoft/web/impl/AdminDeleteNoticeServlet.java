package com.neusoft.web.impl;

public class AdminDeleteNoticeServlet extends UserControllerSupport {
	@Override
	public String execute() throws Exception {
		this.update("adminNoticeDelete", "ɾ��");
		this.saveNoticePageDataForDelete();
		return "adminNotice";
	}

}

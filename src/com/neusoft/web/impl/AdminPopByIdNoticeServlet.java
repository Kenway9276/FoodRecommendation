package com.neusoft.web.impl;

public class AdminPopByIdNoticeServlet extends UserControllerSupport {
@Override
	public String execute() throws Exception {
		update("adminPopById", "�ö�");
		this.saveNoticePageData();
		return "adminNotice";
	}

}

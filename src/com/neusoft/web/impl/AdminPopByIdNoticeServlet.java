package com.neusoft.web.impl;

public class AdminPopByIdNoticeServlet extends UserControllerSupport {
@Override
	public String execute() throws Exception {
		update("adminPopById", "÷√∂•");
		this.saveNoticePageData();
		return "adminNotice";
	}

}

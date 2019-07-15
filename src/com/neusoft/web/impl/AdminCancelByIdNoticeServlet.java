package com.neusoft.web.impl;

public class AdminCancelByIdNoticeServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		update("adminCancelById", "È¡Ïû");
		this.saveNoticePageData();
		return "adminNotice";
	}

}

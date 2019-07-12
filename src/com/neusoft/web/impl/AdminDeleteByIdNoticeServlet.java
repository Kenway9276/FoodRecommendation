package com.neusoft.web.impl;

public class AdminDeleteByIdNoticeServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("adminNoticeDeleteById", "É¾³ý");
		this.saveNoticePageDataForDelete();
		return "adminNotice";
	}

}

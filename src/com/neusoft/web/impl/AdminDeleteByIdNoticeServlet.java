package com.neusoft.web.impl;

public class AdminDeleteByIdNoticeServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("adminNoticeDeleteById", "ɾ��");
		this.saveNoticePageDataForDelete();
		return "adminNotice";
	}

}

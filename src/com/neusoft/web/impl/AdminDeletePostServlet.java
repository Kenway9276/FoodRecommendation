package com.neusoft.web.impl;

public class AdminDeletePostServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		update("adminPostDelete", "ɾ��");
		this.saveForumPageDataForDelete();
		return "adminForum";
	}

}

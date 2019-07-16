package com.neusoft.web.impl;

public class AdminDeleteByIdPostServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		update("adminDeleteByIdPost", "É¾³ý");
		this.saveForumPageDataForDelete();
		return "adminForum";
	}

}

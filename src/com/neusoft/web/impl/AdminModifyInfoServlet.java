package com.neusoft.web.impl;

public class AdminModifyInfoServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		update("adminModify", "ÐÞ¸Ä");
		return "adminInfo";
	}

}

package com.neusoft.web.impl;

public class AdminModifyInfoServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.updatePWD("adminModify", "ÐÞ¸Ä");
		return "adminInfo";
	}
}

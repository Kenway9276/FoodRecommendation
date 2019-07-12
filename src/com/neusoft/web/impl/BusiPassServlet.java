package com.neusoft.web.impl;

public class BusiPassServlet extends UserControllerSupport {
	@Override
	public String execute() throws Exception {
		this.update("busiPassModify", "ÐÞ¸Ä");
		this.saveBusiPageDataForPass();
		return "adminBusiness";
	}

}

package com.neusoft.web.impl;

public class BusiPassServlet extends UserControllerSupport {
	@Override
	public String execute() throws Exception {
		this.update("busiPassModify", "�޸�");
		this.saveBusiPageDataForPass();
		return "adminBusiness";
	}

}

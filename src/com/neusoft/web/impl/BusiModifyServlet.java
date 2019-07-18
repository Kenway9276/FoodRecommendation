package com.neusoft.web.impl;

public class BusiModifyServlet extends BusiControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("busiModify", "修改");
		this.saveBusiLoginInstance();
		return "busiModify";
	}
}

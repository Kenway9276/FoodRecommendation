package com.neusoft.web.impl;

public class BusiModifyServlet extends BusiControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("busiModify", "�޸�");
		return "busiModify";
	}

}

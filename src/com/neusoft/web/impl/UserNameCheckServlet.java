package com.neusoft.web.impl;

public class UserNameCheckServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		//update("userNameCheck","�û�������");
		this.saveOtherPageData("data", "userNameCheck");
		return "ajax";
	}

}

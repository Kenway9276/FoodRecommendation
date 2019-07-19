package com.neusoft.web.impl;

public class BusiNotPassServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("busiNotPass", "дцоб");
		return "shopsearch";
	}

}

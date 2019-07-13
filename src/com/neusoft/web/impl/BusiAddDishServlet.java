package com.neusoft.web.impl;

public class BusiAddDishServlet extends BusiControllerSupport {

	@Override
	public String execute() throws Exception {
		update("busiAddDish", "添加");
		return "busiAddDish";
	}

}

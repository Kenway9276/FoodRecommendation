package com.neusoft.web.impl;

public class BusiNameCheckServlet extends BusiControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveOtherPageData("data", "busiNameCheck");
		return "ajax";
	}

}

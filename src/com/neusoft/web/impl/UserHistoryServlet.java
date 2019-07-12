package com.neusoft.web.impl;

public class UserHistoryServlet extends UserControllerSupport {
	@Override
	public String execute() throws Exception 
	{
		this.saveHistoryPageData();
		return "userHistory";
	}
}

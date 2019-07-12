package com.neusoft.web.impl;

public class UserDeleteHistoryServlet extends UserControllerSupport
 {
	@Override
	public String execute() throws Exception {
		this.update("userHistoryDelete", "É¾³ý");
		this.saveHistoryPageDataForDelete();
		return "userHistory";
	}

}

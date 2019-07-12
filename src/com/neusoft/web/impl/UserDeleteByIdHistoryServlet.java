package com.neusoft.web.impl;

public class UserDeleteByIdHistoryServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("userHistoryDeleteById", "É¾³ý");
		this.saveHistoryPageDataForDelete();
		return "userHistory";
	}

}

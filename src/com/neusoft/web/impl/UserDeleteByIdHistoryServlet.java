package com.neusoft.web.impl;

public class UserDeleteByIdHistoryServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("userHistoryDeleteById", "ɾ��");
		this.saveHistoryPageDataForDelete();
		return "userHistory";
	}

}

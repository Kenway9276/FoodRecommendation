package com.neusoft.web.impl;

public class MessageReadServlet extends MessageControllerSupport{

	@Override
    public String execute() throws Exception
	{
		this.update("setMessageRead", "�޸�");
		this.savePageData();
		return "message";
    }

}

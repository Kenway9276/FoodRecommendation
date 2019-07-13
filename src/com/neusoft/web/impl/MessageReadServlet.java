package com.neusoft.web.impl;

public class MessageReadServlet extends MessageControllerSupport{

	@Override
    public String execute() throws Exception
	{
		this.update("setMessageRead", "ÐÞ¸Ä");
		this.savePageData();
		return "message";
    }

}

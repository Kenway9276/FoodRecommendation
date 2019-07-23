package com.neusoft.web.impl;

public class BusiFindByIdNoticeServlet extends UserControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.saveNoticeInstance();
		return "busiNoticeInfo";
	}
}

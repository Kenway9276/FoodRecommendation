package com.neusoft.web.impl;

public class MarkQueryServlet extends MarkControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "markquery";		
    }
}

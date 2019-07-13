package com.neusoft.web.impl;

public class MarkDeleteAllServlet extends MarkControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("deleteAllMark", "É¾³ý");
		this.savePageDataForDelete();
		return "markquery";		
    }
}

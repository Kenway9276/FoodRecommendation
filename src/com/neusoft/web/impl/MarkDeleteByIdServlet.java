package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class MarkDeleteByIdServlet extends MarkControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForDelete();
		return "markquery";		
    }
}

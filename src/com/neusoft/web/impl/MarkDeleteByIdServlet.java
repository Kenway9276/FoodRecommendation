package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class MarkDeleteByIdServlet extends MarkControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("deleteById", "ɾ��");
		this.savePageDataForDelete();
		return "markquery";		
    }
}

package com.neusoft.web.impl;

public class MarkBatchDeleteServlet extends MarkControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "ɾ��");
		this.savePageDataForDelete();
		return "markquery";		
    }
}

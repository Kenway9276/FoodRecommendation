package com.neusoft.web.impl;

public class MarkDeleteInShopDetailServlet extends MarkControllerSupport 
{
	public String execute() throws Exception
	{
		this.update("deleteMarkInShopDetail", "ȡ��");
		return "shopdetail";
    }
}

package com.neusoft.web.impl;

public class MarkDeleteInShopDetailServlet extends MarkControllerSupport 
{
	public String execute() throws Exception
	{
		this.update("deleteMarkInShopDetail", "È¡Ïû");
		return "shopdetail";
    }
}

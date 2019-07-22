package com.neusoft.web.impl;

public class ShopCloseServlet extends UserControllerSupport
{
	@Override
    public String execute() throws Exception 
	{
		this.executeUpdateMethod("busiNotPass");
        return "shopsearch";
    }
}

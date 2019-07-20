package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class CommentToDoServlet extends CommentControllerSupport{

	@Override
	public String execute() throws Exception
	{
		//储存当前商家流水号
		this.saveMapPageData("ins", "saveShopID");
		return "comment";		
    }
}

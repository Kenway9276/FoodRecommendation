package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class CommentAddServlet extends CommentControllerSupport{

	@Override
	//–¥µ„∆¿
	public String execute() throws Exception
	{
		this.executeUpdateMethod("userAddComment");
		return "comment";		
    }
}

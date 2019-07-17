package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class CommentDelByIdServlet extends CommentControllerSupport{

	@Override
	//–¥µ„∆¿
	public String execute() throws Exception
	{
		this.executeUpdateMethod("delCommentById");
		return "shopdetail";		
    }
}
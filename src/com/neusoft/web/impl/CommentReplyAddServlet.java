package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class CommentReplyAddServlet extends CommentControllerSupport{

	@Override
	//д����
	public String execute() throws Exception
	{
		this.executeUpdateMethod("shopAddReply");
		return "shopdetail";		
    }
}
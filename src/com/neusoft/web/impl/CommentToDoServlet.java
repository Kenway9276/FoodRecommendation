package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class CommentToDoServlet extends CommentControllerSupport{

	@Override
	public String execute() throws Exception
	{
		return "comment";		
    }
}

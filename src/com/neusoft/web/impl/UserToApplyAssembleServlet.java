package com.neusoft.web.impl;

public class UserToApplyAssembleServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.getAssembleById();
		return "userApplyAssemble";
	}

}

package com.neusoft.web.impl;

public class UserApplyAssembleServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("sendUserAssembleMsg", "申请");
		this.saveUserAssembleInstance();
		return "userAssemble";
	}
}

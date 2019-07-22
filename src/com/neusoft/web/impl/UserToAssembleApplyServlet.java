package com.neusoft.web.impl;

public class UserToAssembleApplyServlet extends BusiControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.busiConvertBusiId();
		return "userAssembleApply";
	}
}

package com.neusoft.web.impl;

public class UserToApplyAssembleServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.getAssembleById();
		this.busiConvertBusiId();
		this.update("sendUserAssembleMsg", "发送");
		return "userApplyAssemble";
	}

}

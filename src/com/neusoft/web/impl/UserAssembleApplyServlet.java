package com.neusoft.web.impl;

public class UserAssembleApplyServlet extends UserControllerSupport 
{

	@Override
	public String execute() throws Exception {
		this.update("userAssembleApply", "申请");
		return "userAssembleApply";
	}

}

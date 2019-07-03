package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class ModifyEmpServlet extends EmpControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyEmp", "ÐÞ¸Ä");
		return "addEmp";
	}

}

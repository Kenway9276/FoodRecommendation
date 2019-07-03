package com.neusoft.web.impl;

public class FindByIdEmpServlet extends EmpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addEmp";
	}

}

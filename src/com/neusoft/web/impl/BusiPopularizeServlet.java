package com.neusoft.web.impl;

public class BusiPopularizeServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.setBusiPopularizeEndTime();
		return "busiPopularize";
	}

}

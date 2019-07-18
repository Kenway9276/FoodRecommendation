package com.neusoft.web.impl;

public class BusiToPopularizeServlet extends BusiControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.saveBusiPopularizeInstance();
		return "busiPopularize";
	}
}

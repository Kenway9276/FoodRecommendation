package com.neusoft.web.impl;

public class BusiToEnvironmentPageServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("Address", "saveBusiEnvironmentPicAddress");	
		this.busiConvertBusiId();
		return "busiManageEnvironmentPic";	
	}

}

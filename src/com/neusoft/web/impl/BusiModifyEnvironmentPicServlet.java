package com.neusoft.web.impl;

public class BusiModifyEnvironmentPicServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("busiModifyEnvirnmentPic", "修改");
		this.savePageData("Address", "saveBusiEnvironmentPicAddress");	
		this.busiConvertBusiId();
		return "busiManageEnvironmentPic";	
	}

}

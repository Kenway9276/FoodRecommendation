package com.neusoft.web.impl;

public class BusiToPortraitPicServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.saveBusiPortrait();
		return "busiPortraitPic";
	}
}

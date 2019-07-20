package com.neusoft.web.impl;

public class BusiToCertificationPageServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.busiToCertificatePage();
		return "busiCertificateUpload";
	}

}

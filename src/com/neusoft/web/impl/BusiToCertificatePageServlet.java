package com.neusoft.web.impl;

public class BusiToCertificatePageServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.busiToCertificatePage();
		return "busiCertificateUpload";
	}

}

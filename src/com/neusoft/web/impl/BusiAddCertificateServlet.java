package com.neusoft.web.impl;

public class BusiAddCertificateServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("busiAddCertificate", "资质证明修改");
		this.busiToCertificatePage();
		return "busiCertificateUpload";
	}

}

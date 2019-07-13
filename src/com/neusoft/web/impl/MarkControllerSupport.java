package com.neusoft.web.impl;

import com.neusoft.services.impl.MarkServicesImpl;
import com.neusoft.services.impl.MessageServicesImpl;
import com.neusoft.services.impl.ShopinfoServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class MarkControllerSupport extends ControllerSupport{

	public MarkControllerSupport() 
	{
		this.setServices(new MarkServicesImpl());
	}

}
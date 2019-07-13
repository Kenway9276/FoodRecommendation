package com.neusoft.web.impl;

import com.neusoft.services.impl.MessageServicesImpl;
import com.neusoft.services.impl.ShopinfoServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ShopinfoControllerSupport extends ControllerSupport{

	public ShopinfoControllerSupport() 
	{
		this.setServices(new ShopinfoServicesImpl());
	}

}

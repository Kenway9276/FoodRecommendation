package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class BusiControllerSupport extends ControllerSupport {

	public BusiControllerSupport() 
	{
		this.setServices(new Ab01ServicesImpl());
	}
}

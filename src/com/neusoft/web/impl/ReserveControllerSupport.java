package com.neusoft.web.impl;

import com.neusoft.services.impl.CommentServicesImpl;
import com.neusoft.services.impl.ReserveServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ReserveControllerSupport extends ControllerSupport{

	public ReserveControllerSupport() 
	{
		this.setServices(new ReserveServicesImpl());
	}

}
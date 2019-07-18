package com.neusoft.web.impl;

import com.neusoft.services.impl.CommentServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class CommentControllerSupport extends ControllerSupport{

	public CommentControllerSupport() 
	{
		this.setServices(new CommentServicesImpl());
	}

}

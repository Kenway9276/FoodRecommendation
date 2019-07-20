package com.neusoft.web.impl;

public class BusiManageReservationServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.saveTodoReservationInstance();
		this.saveReservationInstance();
		this.busiConvertBusiId();
		return "busiManageReservation";
	}

}

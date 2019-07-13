package com.neusoft.web.impl;

public class BusiAccessReservationServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("busiAccessReservation", "通过");
		this.saveTodoReservationInstance();
		this.saveReservationInstance();
		return "busiManageReservation";
	}

}

package com.neusoft.web.impl;

public class BusiRefuseReservationServlet extends BusiControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("busiRefuseReservation", "拒绝");
		this.saveTodoReservationInstance();
		this.saveReservationInstance();
		this.busiConvertBusiId();
		return "busiManageReservation";
	}

}

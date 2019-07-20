package com.neusoft.web.impl;

public class MapGuideServlet extends MapControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.saveMapPageData("Address", "getAddress");
		return "map";		
    }
}

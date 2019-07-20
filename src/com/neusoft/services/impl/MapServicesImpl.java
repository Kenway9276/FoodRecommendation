package com.neusoft.services.impl;

import java.util.HashMap;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class MapServicesImpl extends JdbcServicesSupport
{
	//地图导航功能
	public Map<String,String> getAddress()
	{
		Map map=new HashMap<>();
		String address=this.get("aab106").toString();
		map.put("address", address);
		return map;
		
	} 
}

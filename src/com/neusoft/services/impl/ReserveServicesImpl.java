package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

//预定座位功能
public class ReserveServicesImpl extends JdbcServicesSupport
{
	private boolean addReserve()throws Exception
    {

    	//提交订座申请
		StringBuilder sql=new StringBuilder()
    			.append("insert into ac01(aaa101,aab101,aac102,aac103,aac104,aac106,aaa201)")
    			.append("          values(?,?,?,?,?,?,?)");
		Object args[]=
			{
					
					this.get("userID"),
					this.get("aab101"),
					Tools.getDateTime(),
					this.get("aac103"),
					this.get("aac104"),
					0,
					this.get("aaa201")
					
			};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
}

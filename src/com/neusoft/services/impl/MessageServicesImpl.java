package com.neusoft.services.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HandshakeCompletedEvent;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class MessageServicesImpl extends JdbcServicesSupport 
{
	
	/* 消息状态     aac304  1-未读    0-已读
	 * 
	 */
	
	
	
	//查看未读消息
	public List<Map<String,String>> queryUnRead()throws Exception
	{
		String sql1=null;
		String sql2=null;
		sql1 = "select aac301, aac302, aac303 , aac304 from ac03  where aaa101=? And aac304='1' ";
		sql2 = "select aac301, aac302, aac303 , aac304 from ac03  where aab101=? And aac304='1' ";

		if(this.get("busiID")==null)
		{
			return this.queryForList(sql1, this.get("userID"));
		}
		else return this.queryForList(sql2, this.get("busiID"));    	
	}
	//存储状态
	public Map<String,String> saveStausForUnRead()throws Exception
	{
		Map map= new HashMap<>();
		map.put("status", "UnRead");
		return map;
	}
	
	
	
	//查看已读
	public List<Map<String,String>> queryRead()throws Exception
	{
		String sql1=null;
		String sql2=null;
		sql1 = "select aac301, aac302, aac303 , aac304 from ac03  where aaa101=? And aac304='0' ";
		sql2 = "select aac301, aac302, aac303 , aac304 from ac03  where aab101=? And aac304='0' ";

		if(this.get("busiID")==null)
		{
			return this.queryForList(sql1, this.get("userID"));
		}
		else return this.queryForList(sql2, this.get("busiID"));    	
	}
	//存储状态
	public Map<String,String> saveStausForRead()throws Exception
	{
		Map map= new HashMap<>();
		map.put("status", "Read");
		return map;
	}
	
	
	
	//发送消息给用户
	public boolean addMessageToCust(String MessageText,String CustId)throws Exception
	{
		String DateTime= Tools.getDateTime();
		String sql="insert into ac03 (aaa101,aac302,aac303,aac304) values (?,?,?,?)";
		Object args[]={CustId,MessageText,DateTime,"1"};
		return this.executeUpdate(sql, args)>0;
	}
	
	
	//发送消息给商家
	public boolean addMessageToBuss(String MessageText,String BussId)throws Exception
	{
		String DateTime= Tools.getDateTime();
		String sql="insert into ac03 (aab101,aac302,aac303,aac304) values (?,?,?,?)";
		Object args[]={BussId,MessageText,DateTime,"1"};
		return this.executeUpdate(sql, args)>0;
	}
	
	
	//设为消息已读
	private boolean setMessageRead()throws Exception
	{
		String sql="update ac03 set aac304='0' where aac301=? ";
		return this.executeUpdate(sql, this.get("aac301"))>0;
	}
	
	
	//全部设为已读
	private boolean setAllMessageRead()throws Exception
	{
		String sql1="update ac03 set aac304='0' where aaa101=? ";
		String sql2="update ac03 set aac304='0' where aab101=? ";
		if(this.get("busiID")!=null)
    	{ 		
    		return this.executeUpdate(sql1, this.get("userID"))>0;
    	}
		else return this.executeUpdate(sql2, this.get("busiID"))>0;
	}
	
	
	//删除消息
	private boolean deleteMessageById()throws Exception
	{
		String sql="delete from ac03 where aac301=? ";
		return this.executeUpdate(sql, this.get("aac301"))>0;	
	}
	
	
	//删除所有已读消息
	private boolean deleteAllReadMessage()throws Exception
    {
		String sql1="delete from ac03 where aaa101=? AND aac304='0' ";
		String sql2="delete from ac03 where aab101=? AND aac304='0' ";
		if(this.get("userID")==null)
    	{ 		
    		return this.executeUpdate(sql2, this.get("busiID"))>0;
    	}
		else return this.executeUpdate(sql1, this.get("userID"))>0;
    }
	
}

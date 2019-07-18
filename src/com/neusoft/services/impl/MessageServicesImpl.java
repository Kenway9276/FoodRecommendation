package com.neusoft.services.impl;


import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class MessageServicesImpl extends JdbcServicesSupport 
{
	
	/* ��Ϣ״̬     aac304  1-δ��    0-�Ѷ�
	 * 
	 */
	
	
	
	//�鿴δ����Ϣ
	public List<Map<String,String>> queryUnRead()throws Exception
	{
		String sql1=null;
		String sql2=null;
		sql1 = "select aac301, aac302, aac303 , aac304 from ac03  where aaa101=? And aac304='1' ";
		sql2 = "select aac301, aac302, aac303 , aac304 from ac03  where aab101=? And aac304='1' ";

		if(this.get("aab101")==null)
		{
			return this.queryForList(sql1, this.get("aaa101"));
		}
		else return this.queryForList(sql2, this.get("aab101"));    	
	}
	
	
	//�鿴�Ѷ�
	public List<Map<String,String>> queryRead()throws Exception
	{
		String sql1=null;
		String sql2=null;
		sql1 = "select aac301, aac302, aac303 , aac304 from ac03  where aaa101=? And aac304='0' ";
		sql2 = "select aac301, aac302, aac303 , aac304 from ac03  where aab101=? And aac304='0' ";

		if(this.get("aab101")==null)
		{
			return this.queryForList(sql1, this.get("aaa101"));
		}
		else return this.queryForList(sql2, this.get("aab101"));    	
	}
	
	
	//������Ϣ���û�
	public boolean addMessageToCust(String MessageText,String CustId)throws Exception
	{
		String DateTime= Tools.getDateTime();
		String sql="insert into ac03 (aaa101,aac302,aac303,aac304) values (?,?,?,?)";
		Object args[]={CustId,MessageText,DateTime,"1"};
		return this.executeUpdate(sql, args)>0;
	}
	
	
	//������Ϣ���̼�
	public boolean addMessageToBuss(String MessageText,String BussId)throws Exception
	{
		String DateTime= Tools.getDateTime();
		String sql="insert into ac03 (aab101,aac302,aac303,aac304) values (?,?,?,?)";
		Object args[]={BussId,MessageText,DateTime,"1"};
		return this.executeUpdate(sql, args)>0;
	}
	
	
	//��Ϊ��Ϣ�Ѷ�
	private boolean setMessageRead()throws Exception
	{
		String sql="update ac03 set aac304='0' where aac301=? ";
		return this.executeUpdate(sql, this.get("aac301"))>0;
	}
	
	
	//ȫ����Ϊ�Ѷ�
	private boolean setAllMessageRead()throws Exception
	{
		String sql1="update ac03 set aac304='0' where aaa101=? ";
		String sql2="update ac03 set aac304='0' where aab101=? ";
		if(this.get("aaa101")!=null)
    	{ 		
    		return this.executeUpdate(sql1, this.get("aaa101"))>0;
    	}
		else return this.executeUpdate(sql2, this.get("aab101"))>0;
	}
	
	
	//ɾ����Ϣ
	private boolean deleteMessageById()throws Exception
	{
		String sql="delete from ac03 where aac301=? ";
		return this.executeUpdate(sql, this.get("aac301"))>0;	
	}
	
	
	//ɾ�������Ѷ���Ϣ
	private boolean deleteAllReadMessage()throws Exception
    {
		String sql1="delete from ac03 where aaa101=? AND aac304='0' ";
		String sql2="delete from ac03 where aab101=? AND aac304='0' ";
		if(this.get("aaa101")==null)
    	{ 		
    		return this.executeUpdate(sql2, this.get("aab101"))>0;
    	}
		else return this.executeUpdate(sql1, this.get("aaa101"))>0;
    }
	
}

package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class MarkServicesImpl extends JdbcServicesSupport
{
	//aaa401--�ղؼ���ˮ��      aaa101--�û���ˮ�� 
	//aaa402--�ղ�ʱ��	 aab101--�̼���ˮ��
	
	//�û��鿴�ղؼ�(��ʱ������)
	@Override
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append(" SELECT ab01.aab101 , aaa401 , aab104 , aab106 , aab111 , aaa402 FROM aa04 LEFT JOIN ")
				.append(" ab01 on aa04.aab101= ab01.aab101 where aaa101 = ? ORDER BY aaa401 DESC");
		return this.queryForList(sql.toString(), this.get("aaa101"));	
	}
	
	
	//��ӵ��ղ�
	private boolean addMark()throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append(" insert into aa04(aaa402 , aaa101 , aab101) ")
    			.append(" values(?,?,?) ");
		String DateTime = Tools.getDateTime();
		Object args[]={DateTime,this.get("aaa101"),this.get("aab101")};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	//��һȡ����ɾ���ղ�
	private boolean deleteById()throws Exception
    {
    	String sql="delete from aa04 where aaa401=? ";
    	return this.executeUpdate(sql,this.get("aaa401"))>0;
    }
	
	//���̼�����ҳ������û���ˮ�ź��̼���ˮ��ȡ���ղ�
	private boolean deleteMarkInShopDetail()throws Exception
    {
    	String sql="delete from aa04 where aaa101=? And aab101=? ";
    	Object args[]={this.get("aaa101"),this.get("aab101")};
    	return this.executeUpdate(sql,args)>0;
    }
	
	//����ɾ���ղ�
	private boolean batchDelete()throws Exception
    {
    	String sql="delete from aa04 where aaa401=?";
    	String idlist[]=this.getIdList("idlist");
    	return this.batchUpdate(sql, idlist);
    }
	
	
	//����ղ�
	private boolean deleteAllMark()throws Exception
	{
	    String sql="delete from aa04 where aaa101=?";
	    return this.executeUpdate(sql, this.get("aaa101"))>=0;
	}
	
	
}

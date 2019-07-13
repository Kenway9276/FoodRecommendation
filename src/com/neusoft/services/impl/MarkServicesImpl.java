package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class MarkServicesImpl extends JdbcServicesSupport
{
	//aaa401--收藏夹流水号      aaa101--用户流水号 
	//aaa402--收藏时间	 aab101--商家流水号
	
	//用户查看收藏夹(按时间排序)
	@Override
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append(" SELECT ab01.aab101 , aaa401 , aab104 , aab106 , aab111 , aaa402 FROM aa04 LEFT JOIN ")
				.append(" ab01 on aa04.aab101= ab01.aab101 where aaa101 = ? ORDER BY aaa401 DESC");
		return this.queryForList(sql.toString(), this.get("aaa101"));	
	}
	
	
	//添加到收藏
	private boolean addMark()throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append(" insert into aa04(aaa402 , aaa101 , aab101) ")
    			.append(" values(?,?,?) ");
		String DateTime = Tools.getDateTime();
		Object args[]={DateTime,this.get("aaa101"),this.get("aab101")};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	//单一取消或删除收藏
	private boolean deleteById()throws Exception
    {
    	String sql="delete from aa04 where aaa401=? ";
    	return this.executeUpdate(sql,this.get("aaa401"))>0;
    }
	
	//在商家详情页面根据用户流水号和商家流水号取消收藏
	private boolean deleteMarkInShopDetail()throws Exception
    {
    	String sql="delete from aa04 where aaa101=? And aab101=? ";
    	Object args[]={this.get("aaa101"),this.get("aab101")};
    	return this.executeUpdate(sql,args)>0;
    }
	
	//批量删除收藏
	private boolean batchDelete()throws Exception
    {
    	String sql="delete from aa04 where aaa401=?";
    	String idlist[]=this.getIdList("idlist");
    	return this.batchUpdate(sql, idlist);
    }
	
	
	//清空收藏
	private boolean deleteAllMark()throws Exception
	{
	    String sql="delete from aa04 where aaa101=?";
	    return this.executeUpdate(sql, this.get("aaa101"))>=0;
	}
	
	
}

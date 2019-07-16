package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

//评论功能:用户评论、商家回复评论
public class CommentServicesImpl extends JdbcServicesSupport
{
	

	//用户评分、写点评,同时更新商家的评分
	private boolean userAddComment()throws Exception
	{
		//添加评论和评分
		StringBuilder sql1=new StringBuilder()
    			.append(" insert into ab03(aaa101 , aab101 , aab303 , aab304 , ")
    			.append(" aab305 , aab306 , aab307) values(?,?,?,?,?,?,?) ");
		String Date = Tools.getDate();
		Object args1[]={
				this.get("aaa101"),
				this.get("aab101"),
				this.get("CommentText"),
				Date,
				'0',
				this.get("PhotoAddress"),
				this.get("Score")
				};
		
		//更新商家评分
		StringBuilder sql2=new StringBuilder()
    			.append(" UPDATE ab01 set aab111 = (select avg(aab307) from ab03 where ")
    			.append(" aab101=? AND aab305='0') where ab01.aab101= ?  ");
		Object args2[]={this.get("aab101"),this.get("aab101")};
		
		
		//先添加评论
		boolean flag= this.executeUpdate(sql1.toString(), args1)>0;
		
		//计算并更新商家评分
		this.executeUpdate(sql2.toString(), args2);
		
		return flag; 		
	}
	
	
	//用户删除自己的点评
	private boolean userDelComment()throws Exception
	{
		String sql="delete from ab03 where aaa101=? and aab101=? ";
		Object args[]={this.get("aaa101"),this.get("aab101")};
		return this.executeUpdate(sql, args)>0;
	}
	
	
	//商家回复用户点评
	private boolean shopAddReply()throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append(" insert into ab03(aaa101 , aab101 , aab303 , aab304 , ")
    			.append(" aab305 , aab306 , aab307) values(?,?,?,?,?,?,?) ");
		String Date = Tools.getDate();
		Object args[]={
				this.get("aaa101"),
				this.get("aab101"),
				this.get("ReplyText"),
				Date,
				this.get("aab301"),
				null,
				null
				};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	//处理评论中的图片和文字
	public Map<String,String> DealPhoto()throws Exception
	{
		String htmlstring=this.get("htmltext").toString();
		return null;
	}
	
}

package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.BBSTools;
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
    			.append(" aab305 , aab306 , aab307, aab308) values(?,?,?,?,?,?,?,?) ");
		String Date = Tools.getDate();
		Object args1[]={
				this.get("aaa101"),
				this.get("aab101"),
				DealText(),
				Date,
				0,
				DealPhoto(),
				this.get("aab307"),
				0
				};		
		//先添加评论
		boolean flag= this.executeUpdate(sql1.toString(), args1)>0;
		
		//计算并更新商家评分
		UpdateScore();	
		//更新商家评论数
		UpdateCommentCount();
		
		return flag; 		
	}
	
	
	
	//删除点评
	private boolean delCommentById()throws Exception
	{
		//删除
		String sql1="delete from ab03 where aab301=? ";
		Object args[]={this.get("aab301")};	
		boolean flag=this.executeUpdate(sql1, args)>0;	
		//重新计算评分
		UpdateScore();	
		//重新计算点评数
		UpdateCommentCount();		
		return flag;		
	}
	
	
	//商家回复用户点评
	private boolean shopAddReply()throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append(" insert into ab03(aaa101 , aab101 , aab303 , aab304 , ")
    			.append(" aab305 , aab306 , aab307 , aab308) values(?,?,?,?,?,?,?,?) ");
		String Date = Tools.getDate();
		Object args[]={
				this.get("aaa101"),
				this.get("aab101"),
				this.get("ReplyText"+this.get("aab301").toString()),
				Date,
				this.get("aab301"),
				null,
				null,
				null
				};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	
	//从编辑器中处理文字
	public String DealText()throws Exception
	{
		String CommentText=this.get("aab306").toString();
		return CommentText;
	}
	//从编辑器中处理图片并保存
	public String DealPhoto()throws Exception
	{
		String htmlstring=this.get("htmltext").toString();
		String imgpath=BBSTools.getImgFromText(htmlstring, this.get("filePath") + "\\");
		return imgpath;
	}
	
	
	//更新商家评分
	public boolean UpdateScore()throws Exception
	{
		StringBuilder sql2=new StringBuilder()
    			.append(" UPDATE ab01 set aab111 = (select avg(aab307) from ab03 where ")
    			.append(" aab101=? AND aab305='0') where ab01.aab101= ?  ");
		Object args2[]={this.get("aab101"),this.get("aab101")};
		return this.executeUpdate(sql2.toString(), args2)>0;
	}
	
	//更新商家点评数
	public boolean UpdateCommentCount()throws Exception
	{
		String sql3="UPDATE ab01 set aab114 = (select COUNT(aab301) FROM ab03 where aab305='0') where aab101=?";
		Object args3[]={this.get("aab101")};
		return this.executeUpdate(sql3, args3)>0;
	}
	
}

package com.neusoft.services.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.BBSTools;
import com.neusoft.system.tools.Tools;

//���۹���:�û����ۡ��̼һظ�����
public class CommentServicesImpl extends JdbcServicesSupport
{
	

	//�û����֡�д����,ͬʱ�����̼ҵ�����
	private boolean userAddComment()throws Exception
	{
		//������ۺ�����
		StringBuilder sql1=new StringBuilder()
    			.append(" insert into ab03(aaa101 , aab101 , aab303 , aab304 , ")
    			.append(" aab305 , aab306 , aab307, aab308) values(?,?,?,?,?,?,?,?) ");
		String Date = Tools.getFDate();
		Object args1[]={
				this.get("userID"),
				this.get("aab101"),
				DealText(),
				Date,
				0,
				DealPhoto(),
				this.get("aab307"),
				0
				};		
		//���������
		boolean flag= this.executeUpdate(sql1.toString(), args1)>0;
		
		//���㲢�����̼�����
		UpdateScore();	
		//�̼��ƹ�
		UpdateScoreWhenPopularize();
		//�����̼�������
		UpdateCommentCount();
		
		return flag; 		
	}
	
	
	
	//ɾ������
	private boolean delCommentById()throws Exception
	{
		//ɾ��
		String sql1="delete from ab03 where aab301=? ";
		Object args[]={this.get("aab301")};	
		boolean flag=this.executeUpdate(sql1, args)>0;	
		//���¼�������
		UpdateScore();	
		//���¼��������
		UpdateCommentCount();		
		return flag;		
	}
	
	
	//�̼һظ��û�����
	private boolean shopAddReply()throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append(" insert into ab03(aaa101 , aab101 , aab303 , aab304 , ")
    			.append(" aab305 , aab306 , aab307 , aab308) values(?,?,?,?,?,?,?,?) ");
		String Date = Tools.getDate();
		Object args[]={
				this.get("aaa101"),
				this.get("busiID"),
				this.get("ReplyText"+this.get("aab301").toString()),
				Date,
				this.get("aab301"),
				null,
				null,
				null
				};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	
	//�ӱ༭���д�������
	public String DealText()throws Exception
	{
		if(this.get("aab306")!=null)
		{
			String CommentText=this.get("aab306").toString();
			return CommentText;
		}
		else return "";
	}
	//�ӱ༭���д���ͼƬ������
	public String DealPhoto()throws Exception
	{
		String htmlstring=this.get("htmltext").toString();
		String imgpath=BBSTools.getImgFromText(htmlstring, this.get("filePath") + "\\");
		return imgpath;
	}
	
	
	//�����̼�����
	public boolean UpdateScore()throws Exception
	{
		StringBuilder sql2=new StringBuilder()
    			.append(" UPDATE ab01 set aab111 = (select avg(aab307) from ab03 where ")
    			.append(" aab101=? AND aab305='0') where ab01.aab101= ?  ");
		Object args2[]={this.get("aab101"),this.get("aab101")};
		return this.executeUpdate(sql2.toString(), args2)>0;
	}
	//�̼��ƹ�
	private void UpdateScoreWhenPopularize()throws Exception
	{
		StringBuilder sql = new StringBuilder()	
				.append("SELECT a.aab101,a.aab111,b.aab101,b.aab402")
				.append("	FROM ab01 a,ab04 b")
				.append("	WHERE a.aab101=b.aab101 AND a.aab101 = ?")
				;
		Map<String,String> tmp = this.queryForMap(sql.toString(), this.get("aab101"));
		Object aab402 = tmp.get("aab402");
		if(aab402.equals("1"))
		{
			Double aab111 = Double.valueOf(String.valueOf(tmp.get("aab111")));
			aab111+=0.2;
			if(aab111>5.0)
			{
				aab111=5.0;
			}
			String rsql = "UPDATE ab01 SET aab111=? WHERE aab101 = ?";
			Object args[]=
				{
						aab111,
						this.get("aab101")
				};
			this.executeUpdate(rsql, args);
		}	
	}
	
	//�����̼ҵ�����
	public boolean UpdateCommentCount()throws Exception
	{
		String sql3="UPDATE ab01 set aab114 = (select COUNT(aab301) FROM ab03 where aab305='0' AND aab101=?) where aab101=?";
		Object args3[]={
				this.get("aab101"),
				this.get("aab101")
				};
		return this.executeUpdate(sql3, args3)>0;
	}
	
	//��ʱ�����̼���ˮ��
	public Map<String, String> saveShopID()throws Exception
	{
		String aab101 = this.get("aab101").toString();
		Map<String,String> ins =new HashMap<>();
		ins.put("aab101", aab101);
		return ins;			
	}
	
	
	//�������״̬
	public Map<String, String> saveStatus()throws Exception
	{
		Map<String,String> ins =new HashMap<>();
		ins.put("status", "1" );
		return ins;			
	}
	
}

package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.coyote.http2.Flags;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.BBSTools;
import com.neusoft.system.tools.Tools;

//���ܵ�:  ��������ȡ������Ϣ
public class ShopinfoServicesImpl extends JdbcServicesSupport
{

	//�ڵ�ǰ��λ�����¸��ݵ��������߲�Ʒģ����������
	//��ѯ�����������ؼ��ʵĲ���,���߲�Ʒ�������ؼ��ʵĲ���
	@Override
	public List<Map<String,String>> query()throws Exception
	{
		/*	aab104--������    aab111--����           aab114--������
		 * 	aab106--��ַ        aab113--�̼�ͼ��
		 *  aab207--��Ʒ��
		 */	
		StringBuilder sql=new StringBuilder()
				.append(" select ab01.aab101 , aab104 , aab113 , aab111, ") 
				.append(" aab114 , aab106 , aab107 , aab110  from ab01 ") 
				.append(" left join ab02 on ab01.aab101=ab02.aab101 ")
				.append(" WHERE (aab104 like CONCAT('%', ?, '%') ") 
				.append(" OR aab207 like CONCAT('%', ?, '%') ) AND aab105='1' ")
				.append(" AND aab106 like CONCAT('%', ?, '%')")
				.append(" group by ab01.aab101 ");
		//�û������˳���
		if(this.get("cityName")!=null)
		{
			Object args[]={this.get("keywords"),this.get("keywords"),this.get("cityName")};
			return this.queryForList(sql.toString(), args);
		}
		//�û�Ĭ��ѡ��ǰ����
		else
		{
			Object args[]={this.get("keywords"),this.get("keywords"),this.get("localcity")};
			return this.queryForList(sql.toString(), args);
		}
	}
	
	
	public List<Map<String,String>> queryAllShop()throws Exception
	{
		/*	aab104--������    aab111--����           aab114--������
		 * 	aab106--��ַ        aab113--�̼�ͼ��
		 *  aab207--��Ʒ��
		 */	
		StringBuilder sql=new StringBuilder()
				.append(" select ab01.aab101 , aab104 , aab113 , aab111, ") 
				.append(" aab114 , aab106 , aab107 , aab110  from ab01 ") 
				.append(" left join ab02 on ab01.aab101=ab02.aab101 ")
				.append(" WHERE ") 
				.append(" aab105='1' ")
				.append(" AND aab106 like CONCAT('%', ?, '%')")
				.append(" group by ab01.aab101 ");


		Object args[]=
		{
				this.get("localcity")
		};
		
		return this.queryForList(sql.toString(), args);
	}
	
	
	
	
	
	//��ѯ������������������
	public List<Map<String,String>> queryOrderByScore()throws Exception
	{
		//aab111--����
		
		//���������
		if((this.get("CurrentKeywords")!=null)&&(this.get("CurrentCityName")!=null))
		{
			StringBuilder sql1=new StringBuilder()
					.append(" select ab01.aab101 , aab104 , aab113 , aab111, ") 
					.append(" aab114 , aab106 , aab107 , aab110  from ab01 ") 
					.append(" left join ab02 on ab01.aab101=ab02.aab101 ")
					.append(" WHERE (aab104 like CONCAT('%', ?, '%') ") 
					.append(" OR aab207 like CONCAT('%', ?, '%') ) AND aab105='1' ")
					.append(" AND aab106 like CONCAT('%', ?, '%')")
					.append(" group by ab01.aab101 ")
			        .append(" ORDER BY ab01.aab111 DESC ");
			
			Object args[]={	this.get("CurrentKeywords"),
							this.get("CurrentKeywords"),
							this.get("CurrentCityName")};
			return this.queryForList(sql1.toString(), args);
		}
		
		
		//���ȫ�������
		else
		{
			StringBuilder sql2=new StringBuilder()
					.append(" select ab01.aab101 , aab104 , aab113 , aab111, ") 
					.append(" aab114 , aab106 , aab107 , aab110  from ab01 ") 
					.append(" left join ab02 on ab01.aab101=ab02.aab101 ")
					.append(" WHERE ") 
					.append(" aab105='1' ")
					.append(" AND aab106 like CONCAT('%', ?, '%')")
					.append(" group by ab01.aab101 ")
			        .append(" ORDER BY ab01.aab111 DESC ");
			
			Object args[]={this.get("localcity")};
			return this.queryForList(sql2.toString(), args);
		}
		
	}
	
	
	
	//��ѯ���������յ���������
	public List<Map<String,String>> queryOrderByCommentCount()throws Exception
	{
		//aab114--������
		//�жϹؼ����Ƿ�Ϊ��
		if((this.get("CurrentKeywords")!=null)&&(this.get("CurrentCityName")!=null))
		{
			StringBuilder sql1=new StringBuilder()
					.append(" select ab01.aab101 , aab104 , aab113 , aab111, ") 
					.append(" aab114 , aab106 , aab107 , aab110  from ab01 ") 
					.append(" left join ab02 on ab01.aab101=ab02.aab101 ")
					.append(" WHERE (aab104 like CONCAT('%', ?, '%') ") 
					.append(" OR aab207 like CONCAT('%', ?, '%') ) AND aab105='1' ")
					.append(" AND aab106 like CONCAT('%', ?, '%')")
					.append(" group by ab01.aab101 ")
			        .append(" ORDER BY ab01.aab114 DESC ");
			
			Object args[]={	this.get("CurrentKeywords"),
							this.get("CurrentKeywords"),
							this.get("CurrentCityName")};
			return this.queryForList(sql1.toString(), args);
		}
		
		
		//���ȫ�������
		else
		{
			StringBuilder sql2=new StringBuilder()
					.append(" select ab01.aab101 , aab104 , aab113 , aab111, ") 
					.append(" aab114 , aab106 , aab107 , aab110  from ab01 ") 
					.append(" left join ab02 on ab01.aab101=ab02.aab101 ")
					.append(" WHERE ") 
					.append(" aab105='1' ")
					.append(" AND aab106 like CONCAT('%', ?, '%')")
					.append(" group by ab01.aab101 ")
			        .append(" ORDER BY ab01.aab114 DESC ");
			
			Object args[]={this.get("localcity")};
			return this.queryForList(sql2.toString(), args);
		}
	}
	
	

	@Override
	//��������ҳ��,���ݵ�����ˮ�Ų�ѯ������ϸ��Ϣ
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append(" select aab101, aab102 , aab103 , aab104 , aab105 , aab106 ")
				.append(" , aab107, aab108 , aab109 , aab110 , aab111 , aab112 ")
				.append(" , aab113, aab114 from ab01 where aab101 = ? ");
		return this.queryForMap(sql.toString(), getaab101());
	}
	
	
	
	
	//��������ҳ��,��ѯ�˵�
	public List<Map<String,String>> queryMenu()throws Exception
	{
		/*	aab202--ͼƬ    aab203--�۸�
		 *  aab207--��Ʒ��
		 */
		Object aab101 =  getaab101();
		String sql = "select aab202 , aab203 , aab207 from ab02 where aab101 = ?";
		return this.queryForList(sql, aab101);
	}
	
	
	//��������ҳ���ж��Ƿ����ղ�
	public List<Map<String,String>> markJudge()throws Exception
	{
		Object aab101 =  getaab101();
		String sql="select aaa401 from aa04 where aaa101=? AND aab101=?";
		Object args[]={this.get("userID"),aab101};
		return this.queryForList(sql, args);
	}
	
	
	//��������ҳ���ж��û��Ƿ��ѵ���
	public List<Map<String,String>> commentJudge()throws Exception
	{
		Object aab101 =  getaab101();
		String sql="select aab301 from ab03 where aaa101=? AND aab101=? AND aab305='0'";
		Object args[]={this.get("userID"),aab101};
		return this.queryForList(sql, args);
	}
	
	//��ʱ�洢���йؼ��ʺ������ؼ���
	public Map<String,String> saveCurrentKeyWords()throws Exception
	{
		String Keywords=this.get("keywords").toString();
		String CityName;
		
		if(this.get("cityName")!=null)
			CityName=this.get("cityName").toString();
		else CityName=this.get("localcity").toString();
		
		Map<String, String> map =new HashMap<>();
		
		map.put("CurrentKeywords", Keywords);
		map.put("CurrentCityName", CityName);
		return map;
	}
	
	//������ٴδ洢���йؼ��ʺ������ؼ���
	public Map<String,String> saveCurrentKeyWordsAgain()throws Exception
	{
		if(this.get("CurrentKeywords")!=null)
		{
			String Keywords=this.get("CurrentKeywords").toString();
			String CityName=this.get("CurrentCityName").toString();
				
			Map<String, String> map =new HashMap<>();		
			map.put("CurrentKeywords", Keywords);
			map.put("CurrentCityName", CityName);
			return map;
		}
		
		else
		{				
			Map<String, String> map =new HashMap<>();		
			map.put("CurrentKeywords", null);
			map.put("CurrentCityName", this.get("localcity").toString());
			return map;
		}
		
	}
	
	
	//�ָ��̼һ���ͼ�ĵ�ַ(xxx.jpg,xxx.jpg,.......)
	public List<Map<String,String>> saveEnPhotoAddress()throws Exception
	{
		System.out.println(this.get("aab101"));
		String sql="select aab109 from ab01 where aab101=? ";
		Object aab101 = this.get("aab101");
		if(aab101 instanceof String[]){
			aab101 = ((String[])this.get("aab101"))[0];
		}
		String str=this.queryForMap(sql, aab101).get("aab109");
		return spiltPhotoAddress(str);
	}
	
	
	//�ָ��̼�����ͼ�ĵ�ַ(xxx.jpg,xxx.jpg,.......)
	public List<Map<String,String>> saveCmPhotoAddress()throws Exception
	{
		String sql="select aab306 , aab301 from ab03 where aab101=? ";
		Object aab101 = this.get("aab101");
		if(aab101 instanceof String[]){
			aab101 = ((String[])this.get("aab101"))[0];
		}
		List<Map<String,String>> list= this.queryForList(sql, aab101);
		for(Map map:list)
		{
			if(map.get("aab306")==null)
				continue;
			
			String str=map.get("aab306").toString();
			String strs[]=str.split(",");
			for (int i = 0; i <strs.length; i++)
			{
				map.put("c"+String.valueOf(i),strs[i]);			
			}
			map.put("count", strs.length);
		}
		return list;
	}
	
	
	
	//��ʾ�̼���ʩ
	public Map<String,String> saveEquipment()throws Exception
	{
		String sql="select aab112 from ab01 where aab101=?";
		String str=this.queryForMap(sql, this.get("aab101").toString()).get("aab112");
		String strs[]=str.split(",");
		Map<String,String> map= new HashMap();
		for (int i = 0; i <strs.length; i++)
		{		
			map.put("e"+String.valueOf(i),strs[i]);
		}
		return map;
	}
	
	
	//�̼�����ҳ��鿴����
	public List<Map<String,String>> queryComment()throws Exception
	{
		StringBuilder sql=new StringBuilder()
					.append(" SELECT aab301 , aab101 , ab03.aaa101 , aab303 , aab304 , aab305 ,")
					.append(" aab306 , aab307 , aab308 , aaa103 from ab03 LEFT JOIN aa01 on ")
					.append(" ab03.aaa101 = aa01.aaa101 where aab101= ? ");
		List<Map<String,String>> rows=this.queryForList(sql.toString(), this.get("aab101"));				
		//�����������û����ǳ�,�����Ϊ X******X
		for (Map<String, String> row : rows)
		{ 
			String starStr=Tools.replaceString2Star(row.get("aaa103"), 1, 1);
			row.put("aaa103",starStr);
		}
		return rows;
	}
	
	
	//�̼�����ҳ�����ͳ��
	public Map<String, String> calComment()throws Exception
	{
		//ͳ�ƺ���
		String sq1="SELECT COUNT(aab301) FROM ab03 where aab101=? AND aab305='0' AND aab307='5'";
		//ͳ������
		String sq2="SELECT COUNT(aab301) FROM ab03 where aab101=? AND aab305='0' AND (aab307='4' OR aab307='3') ";
		//ͳ�Ʋ���
		String sq3="SELECT COUNT(aab301) FROM ab03 where aab101=? AND aab305='0' AND (aab307='2' OR aab307='1') ";
		//ͳ����ͼ����
		String sq4="SELECT COUNT(aab301) FROM ab03 where aab101=? AND aab305='0' AND (aab306!='' AND aab306 is not null) ";
		Map<String, String> map =new HashMap<>();
	
		map.put("good", this.queryForMap(sq1, this.get("aab101")).get("count(aab301)"));
		map.put("soso", this.queryForMap(sq2, this.get("aab101")).get("count(aab301)"));
		map.put("bad", this.queryForMap(sq3, this.get("aab101")).get("count(aab301)"));
		map.put("haveP", this.queryForMap(sq4, this.get("aab101")).get("count(aab301)"));
		
		return map;
	}
	
	
	
	
	//�ָ�ͼƬ��ַ
	public List<Map<String , String>> spiltPhotoAddress(String str)
	{
		String strs[]=str.split(",");
		List<Map<String,String>> AddressList=new ArrayList();
		for (int i = 0; i <strs.length; i++)
		{
			Map<String,String> map= new HashMap();
			map.put("address",strs[i]);
			
			AddressList.add(map);
		}
		return AddressList;
	}
	
	
	private Object getaab101(){
		Object aab101 = this.get("aab101");
		if(aab101 instanceof String[]){
			aab101 = ((String[])this.get("aab101"))[0];
		}
		return aab101;
	}


	public boolean updateSelectionPlus() throws Exception {
		Object aaa101 = this.get("userID");
		StringBuilder sql = new StringBuilder()
				.append("UPDATE aa06 ")
				.append("SET aaa602 = aaa602 + 1, ")
				.append("aaa603 = CURRENT_TIMESTAMP ")
				.append("WHERE ")
				.append("	aab101 = ? and aaa101 = ?;")
				;
		Object aab101 = getaab101();
		return this.executeUpdate(sql.toString(), aab101,aaa101) > 0;
	}
	
		
	
	
	
	
	
	//���·�����Ϊ����CommentServicesImpl�еķ���
	//--------------------------------------------------------
	//-------------------------------------------------------
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
		
		//�����̼�����
		public boolean UpdateScore()throws Exception
		{
			StringBuilder sql2=new StringBuilder()
	    			.append(" UPDATE ab01 set aab111 = (select avg(aab307) from ab03 where ")
	    			.append(" aab101=? AND aab305='0') where ab01.aab101= ?  ");
			Object args2[]={this.get("aab101"),this.get("aab101")};
			return this.executeUpdate(sql2.toString(), args2)>0;
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
		
		//�̼һظ��û�����
		private boolean shopAddReply()throws Exception
		{
			StringBuilder sql=new StringBuilder()
	    			.append(" insert into ab03(aaa101 , aab101 , aab303 , aab304 , ")
	    			.append(" aab305 , aab306 , aab307 , aab308) values(?,?,?,?,?,?,?,?) ");
			String Date = Tools.getFDate();
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
			//�����̼�������
			UpdateCommentCount();
			
			return flag; 		
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
		
		//-------------------------------------------------------
		//-------------------------------------------------------
		
		
		
		
		
		//���·�����Ϊ����MarkServicesImpl�еķ���
		//------------------------------------------------------
		//------------------------------------------------------
		
		//���̼�����ҳ������û���ˮ�ź��̼���ˮ��ȡ���ղ�
		private boolean deleteMarkInShopDetail()throws Exception
	    {
	    	String sql="delete from aa04 where aaa101=? And aab101=? ";
	    	Object args[]={this.get("userID"),this.get("aab101")};
	    	return this.executeUpdate(sql,args)>0;
	    }
		//��ӵ��ղ�
		private boolean addMark()throws Exception
		{
			StringBuilder sql1=new StringBuilder()
	    			.append(" insert into aa04(aaa402 , aaa101 , aab101) ")
	    			.append(" values(?,?,?) ");
			String DateTime = Tools.getDateTime();
			Object args[]={DateTime,this.get("userID"),this.get("aab101")};
			return this.executeUpdate(sql1.toString(), args)>0;
		
		}

		public Map<String, String> saveAaa201() throws Exception{
			Map<String, String> res = new HashMap<>();
			if(this.get("aaa201") == null){
				RecommendServiceImpl recommendService = new RecommendServiceImpl();
				String aaa201 = recommendService.getPreferenceIDWithoutFlavour(this.get("userID"));
				res.put("aaa201", aaa201);
			}
			else {
				res.put("aaa201", (String)this.get("aaa201"));
			}
			return res;
		}
}

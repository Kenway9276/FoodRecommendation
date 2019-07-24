package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.coyote.http2.Flags;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.BBSTools;
import com.neusoft.system.tools.Tools;

//功能点:  搜索、获取餐厅信息
public class ShopinfoServicesImpl extends JdbcServicesSupport
{

	//在当前定位城市下根据店铺名或者菜品模糊搜索餐厅
	//查询店铺名包含关键词的餐厅,或者菜品名包含关键词的餐厅
	@Override
	public List<Map<String,String>> query()throws Exception
	{
		/*	aab104--店铺名    aab111--评分           aab114--点评数
		 * 	aab106--地址        aab113--商家图标
		 *  aab207--菜品名
		 */	
		StringBuilder sql=new StringBuilder()
				.append(" select ab01.aab101 , aab104 , aab113 , aab111, ") 
				.append(" aab114 , aab106 , aab107 , aab110  from ab01 ") 
				.append(" left join ab02 on ab01.aab101=ab02.aab101 ")
				.append(" WHERE (aab104 like CONCAT('%', ?, '%') ") 
				.append(" OR aab207 like CONCAT('%', ?, '%') ) AND aab105='1' ")
				.append(" AND aab106 like CONCAT('%', ?, '%')")
				.append(" group by ab01.aab101 ");
		//用户输入了城市
		if(this.get("cityName")!=null)
		{
			Object args[]={this.get("keywords"),this.get("keywords"),this.get("cityName")};
			return this.queryForList(sql.toString(), args);
		}
		//用户默认选择当前城市
		else
		{
			Object args[]={this.get("keywords"),this.get("keywords"),this.get("localcity")};
			return this.queryForList(sql.toString(), args);
		}
	}
	
	
	public List<Map<String,String>> queryAllShop()throws Exception
	{
		/*	aab104--店铺名    aab111--评分           aab114--点评数
		 * 	aab106--地址        aab113--商家图标
		 *  aab207--菜品名
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
	
	
	
	
	
	//查询餐厅并按照评分排序
	public List<Map<String,String>> queryOrderByScore()throws Exception
	{
		//aab111--评分
		
		//搜索情况下
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
		
		
		//浏览全部情况下
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
	
	
	
	//查询餐厅并按照点评数排序
	public List<Map<String,String>> queryOrderByCommentCount()throws Exception
	{
		//aab114--点评数
		//判断关键词是否为空
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
		
		
		//浏览全部情况下
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
	//店铺详情页面,根据店铺流水号查询店铺详细信息
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append(" select aab101, aab102 , aab103 , aab104 , aab105 , aab106 ")
				.append(" , aab107, aab108 , aab109 , aab110 , aab111 , aab112 ")
				.append(" , aab113, aab114 from ab01 where aab101 = ? ");
		return this.queryForMap(sql.toString(), getaab101());
	}
	
	
	
	
	//店铺详情页面,查询菜单
	public List<Map<String,String>> queryMenu()throws Exception
	{
		/*	aab202--图片    aab203--价格
		 *  aab207--菜品名
		 */
		Object aab101 =  getaab101();
		String sql = "select aab202 , aab203 , aab207 from ab02 where aab101 = ?";
		return this.queryForList(sql, aab101);
	}
	
	
	//店铺详情页面判断是否已收藏
	public List<Map<String,String>> markJudge()throws Exception
	{
		Object aab101 =  getaab101();
		String sql="select aaa401 from aa04 where aaa101=? AND aab101=?";
		Object args[]={this.get("userID"),aab101};
		return this.queryForList(sql, args);
	}
	
	
	//店铺详情页面判断用户是否已点评
	public List<Map<String,String>> commentJudge()throws Exception
	{
		Object aab101 =  getaab101();
		String sql="select aab301 from ab03 where aaa101=? AND aab101=? AND aab305='0'";
		Object args[]={this.get("userID"),aab101};
		return this.queryForList(sql, args);
	}
	
	//临时存储城市关键词和搜索关键词
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
	
	//排序后再次存储城市关键词和搜索关键词
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
	
	
	//分割商家环境图的地址(xxx.jpg,xxx.jpg,.......)
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
	
	
	//分割商家评论图的地址(xxx.jpg,xxx.jpg,.......)
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
	
	
	
	//显示商家设施
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
	
	
	//商家详情页面查看评论
	public List<Map<String,String>> queryComment()throws Exception
	{
		StringBuilder sql=new StringBuilder()
					.append(" SELECT aab301 , aab101 , ab03.aaa101 , aab303 , aab304 , aab305 ,")
					.append(" aab306 , aab307 , aab308 , aaa103 from ab03 LEFT JOIN aa01 on ")
					.append(" ab03.aaa101 = aa01.aaa101 where aab101= ? ");
		List<Map<String,String>> rows=this.queryForList(sql.toString(), this.get("aab101"));				
		//过滤评论中用户的昵称,将其变为 X******X
		for (Map<String, String> row : rows)
		{ 
			String starStr=Tools.replaceString2Star(row.get("aaa103"), 1, 1);
			row.put("aaa103",starStr);
		}
		return rows;
	}
	
	
	//商家详情页面点评统计
	public Map<String, String> calComment()throws Exception
	{
		//统计好评
		String sq1="SELECT COUNT(aab301) FROM ab03 where aab101=? AND aab305='0' AND aab307='5'";
		//统计中评
		String sq2="SELECT COUNT(aab301) FROM ab03 where aab101=? AND aab305='0' AND (aab307='4' OR aab307='3') ";
		//统计差评
		String sq3="SELECT COUNT(aab301) FROM ab03 where aab101=? AND aab305='0' AND (aab307='2' OR aab307='1') ";
		//统计有图评论
		String sq4="SELECT COUNT(aab301) FROM ab03 where aab101=? AND aab305='0' AND (aab306!='' AND aab306 is not null) ";
		Map<String, String> map =new HashMap<>();
	
		map.put("good", this.queryForMap(sq1, this.get("aab101")).get("count(aab301)"));
		map.put("soso", this.queryForMap(sq2, this.get("aab101")).get("count(aab301)"));
		map.put("bad", this.queryForMap(sq3, this.get("aab101")).get("count(aab301)"));
		map.put("haveP", this.queryForMap(sq4, this.get("aab101")).get("count(aab301)"));
		
		return map;
	}
	
	
	
	
	//分割图片地址
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
	
		
	
	
	
	
	
	//以下方法均为重用CommentServicesImpl中的方法
	//--------------------------------------------------------
	//-------------------------------------------------------
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
			String sql3="UPDATE ab01 set aab114 = (select COUNT(aab301) FROM ab03 where aab305='0' AND aab101=?) where aab101=?";
			Object args3[]={
					this.get("aab101"),
					this.get("aab101")
					};
			return this.executeUpdate(sql3, args3)>0;
		}
		
		//商家回复用户点评
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
		
		//用户评分、写点评,同时更新商家的评分
		private boolean userAddComment()throws Exception
		{
			//添加评论和评分
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
			//先添加评论
			boolean flag= this.executeUpdate(sql1.toString(), args1)>0;
			
			//计算并更新商家评分
			UpdateScore();	
			//更新商家评论数
			UpdateCommentCount();
			
			return flag; 		
		}
		
		//从编辑器中处理文字
		public String DealText()throws Exception
		{
			if(this.get("aab306")!=null)
			{
				String CommentText=this.get("aab306").toString();
				return CommentText;
			}
			else return "";
		}
		//从编辑器中处理图片并保存
		public String DealPhoto()throws Exception
		{
			String htmlstring=this.get("htmltext").toString();
			String imgpath=BBSTools.getImgFromText(htmlstring, this.get("filePath") + "\\");
			return imgpath;
		}
		
		//-------------------------------------------------------
		//-------------------------------------------------------
		
		
		
		
		
		//以下方法均为重用MarkServicesImpl中的方法
		//------------------------------------------------------
		//------------------------------------------------------
		
		//在商家详情页面根据用户流水号和商家流水号取消收藏
		private boolean deleteMarkInShopDetail()throws Exception
	    {
	    	String sql="delete from aa04 where aaa101=? And aab101=? ";
	    	Object args[]={this.get("userID"),this.get("aab101")};
	    	return this.executeUpdate(sql,args)>0;
	    }
		//添加到收藏
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

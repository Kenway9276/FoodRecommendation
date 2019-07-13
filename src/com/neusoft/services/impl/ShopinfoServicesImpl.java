package com.neusoft.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

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
	
	
	
	//查询餐厅并按照评分排序
	public List<Map<String,String>> queryOrderByScore()throws Exception
	{
		//aab111--评分
		StringBuilder sql=new StringBuilder()
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
		return this.queryForList(sql.toString(), args);
	}
	
	
	
	//查询餐厅并按照点评数排序
	public List<Map<String,String>> queryOrderByCommentCount()throws Exception
	{
		//aab114--点评数
		//判断关键词是否为空
		StringBuilder sql=new StringBuilder()
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
		return this.queryForList(sql.toString(), args);
	}
	
	

	@Override
	//店铺详情页面,根据店铺流水号查询店铺详细信息
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append(" select aab101, aab102 , aab103 , aab104 , aab105 , aab106 ")
				.append(" , aab107, aab108 , aab109 , aab110 , aab111 , aab112 ")
				.append(" , aab113, aab114 from ab01 where aab101 = ? ");
		return this.queryForMap(sql.toString(), this.get("aab101"));
	}
	
	
	
	
	//店铺详情页面,查询菜单
	public List<Map<String,String>> queryMenu()throws Exception
	{
		/*	aab202--图片    aab203--价格
		 *  aab207--菜品名
		 */
		String sql = "select aab202 , aab203 , aab207 from ab02 where aab101 = ?";
		return this.queryForList(sql, this.get("aab101"));
	}
	
	
	//店铺详情页面判断是否已收藏
	public List<Map<String,String>> markJudge()throws Exception
	{
		String sql="select aaa401 from aa04 where aaa101=? AND aab101=?";
		Object args[]={this.get("aaa101"),this.get("aab101")};
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
		String Keywords=this.get("CurrentKeywords").toString();
		String CityName=this.get("CurrentCityName").toString();
			
		Map<String, String> map =new HashMap<>();		
		map.put("CurrentKeywords", Keywords);
		map.put("CurrentCityName", CityName);
		return map;
	}

}

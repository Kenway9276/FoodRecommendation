package com.neusoft.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

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
	
	
	
	//��ѯ������������������
	public List<Map<String,String>> queryOrderByScore()throws Exception
	{
		//aab111--����
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
	
	
	
	//��ѯ���������յ���������
	public List<Map<String,String>> queryOrderByCommentCount()throws Exception
	{
		//aab114--������
		//�жϹؼ����Ƿ�Ϊ��
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
	//��������ҳ��,���ݵ�����ˮ�Ų�ѯ������ϸ��Ϣ
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append(" select aab101, aab102 , aab103 , aab104 , aab105 , aab106 ")
				.append(" , aab107, aab108 , aab109 , aab110 , aab111 , aab112 ")
				.append(" , aab113, aab114 from ab01 where aab101 = ? ");
		return this.queryForMap(sql.toString(), this.get("aab101"));
	}
	
	
	
	
	//��������ҳ��,��ѯ�˵�
	public List<Map<String,String>> queryMenu()throws Exception
	{
		/*	aab202--ͼƬ    aab203--�۸�
		 *  aab207--��Ʒ��
		 */
		String sql = "select aab202 , aab203 , aab207 from ab02 where aab101 = ?";
		return this.queryForList(sql, this.get("aab101"));
	}
	
	
	//��������ҳ���ж��Ƿ����ղ�
	public List<Map<String,String>> markJudge()throws Exception
	{
		String sql="select aaa401 from aa04 where aaa101=? AND aab101=?";
		Object args[]={this.get("aaa101"),this.get("aab101")};
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
		String Keywords=this.get("CurrentKeywords").toString();
		String CityName=this.get("CurrentCityName").toString();
			
		Map<String, String> map =new HashMap<>();		
		map.put("CurrentKeywords", Keywords);
		map.put("CurrentCityName", CityName);
		return map;
	}

}

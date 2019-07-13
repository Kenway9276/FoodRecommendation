package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.web.impl.UserLoginServlet;

public class Ab01ServicesImpl extends JdbcServicesSupport 
{
	
    private boolean deleteById()throws Exception
    {
    	String sql="delete from ab01 where aab101=?";
    	return this.executeUpdate(sql, this.get("aab101")) > 0;
    }
    
    private boolean modifyEmp()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab102=?,a.aab104=?,a.aab105=?,a.aab106=?,a.aab107=?,")
    			.append("       a.aab108=?,a.aab109=?,a.aab110=?,a.aab111=?,a.aab112=?,")
    			.append("       a.aab113=?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			this.get("aab102"),
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			Tools.joinArray(this.get("aab111")),
    			Tools.joinArray(this.get("aab112")),
    			this.get("aab113"),
    			this.get("aab101")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    private boolean busiPassModify()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01")
    			.append("   set aab105=?")
    			.append(" where aab101=?")
    			;
    	Object args[]={
    			"1",
    			this.get("aab101"),
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    private boolean userRegister()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into aa01(aaa102,aaa103,aaa104,aaa105,aaa106,")
    			.append("                 aaa107,aaa108,aaa110)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,CURRENT_DATE)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aaa102"),
       			this.get("aaa103"),
    			this.get("aaa104"),
    			this.get("aaa105"),
    			this.get("aaa106"),
    			this.get("aaa107"),
    			this.get("aaa108"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    private boolean adminReleaseNotice()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac02(aac202,aac203,aac204,aac205,aac206,")
    			.append("                 aac207,aac401)")
    			.append("          values(?,CURRENT_TIMESTAMP,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aac202"),
    			this.get("aac204"),
    			this.get("aac205"),
    			this.get("aac206"),
    			this.get("aac207"),
    			this.get("aac401"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    private boolean userModify()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update aa01")
    			.append("   set aaa103=?,aaa104=?,aaa105=?,aaa106=?,")
    			.append("       aaa107=?,aaa108=?,aaa110=?")
    			.append(" where aaa102=?")
    			;
    	Object args[]={
    			this.get("aaa103"),
    			this.get("aaa104"),
    			this.get("aaa105"),
    			this.get("aaa106"),
    			this.get("aaa107"),
    			this.get("aaa108"),
    			this.get("aaa110"),
    			this.get("aaa102"),
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
   public Map<String, String> userLogin()throws Exception
    {
		StringBuilder sql=new StringBuilder("select * from aa01 where aaa102=? and aaa105=?");
    	Object args[]={
    			this.get("aaa102"),
    			this.get("aaa105"),
    	};
    	return this.queryForMap(sql.toString(), args);
    }
    
    private boolean addEmp()throws Exception
    {
    	//获取当前员工编号
    	String aab103=Tools.getEmpNumber();
    	//向DTO添加员工编号
    	this.put("aab103", aab103);
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
    			.append("                 aab107,aab108,aab109,aab110,aab111,")
    			.append("                 aab112,aab113)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aab102"),
    			aab103,
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			Tools.joinArray(this.get("aab111")),
    			Tools.joinArray(this.get("aab112")),
    			this.get("aab113")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }

    private boolean batchDelete()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ab01 where aab101=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	return this.batchUpdate(sql, idlist);
    }
    
    private boolean userHistoryDelete()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ac01 where aac101=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	return this.batchUpdate(sql, idlist);
    }
    
    private boolean adminNoticeDelete()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ac02 where aac201=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	return this.batchUpdate(sql, idlist);
    }
    
    
    private boolean userHistoryDeleteById()throws Exception
    {
    	String sql="delete from ac01 where aac101=?";
    	return this.executeUpdate(sql, this.get("aac101")) > 0;
    }
    
    private boolean adminNoticeDeleteById()throws Exception
    {
    	String sql="delete from ac02 where aac201=?";
    	return this.executeUpdate(sql, this.get("aac201")) > 0;
    }
    
    
    public Map<String, String> adminLogin()throws Exception
    {
		StringBuilder sql=new StringBuilder("select * from ac04 where aac403=? and aac404=?");
    	Object args[]={
    			this.get("aac403"),
    			this.get("aac404"),
    	};
    	return this.queryForMap(sql.toString(), args);
    }
    
    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
    			.append("       a.aab107,a.aab108,a.aab109,a.aab110,a.aab111,")
    			.append("       a.aab112,a.aab113")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
    public Map<String,String> findByIdNotice()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select aac202,aac203,aac204,aac205,")
    			.append("       aac206,aac207")
    			.append("  from ac02")
    			.append(" where aac201=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aac201"));
    }
    
    
      /**
       * 不定条件查询
       * @return
       * @throws Exception
       */
	  public List<Map<String,String>> query()throws Exception
	  {
	  		//还原页面查询条件
	  		Object aab102=this.get("qaab102");     //姓名  模糊查询
	  		Object aab103=this.get("qaab103");     //编号
	  		Object aab105=this.get("qaab105");     //性别
	  		Object aab106=this.get("qaab106");     //民族
	  		Object baab104=this.get("baab104");    //生日B
	  		Object eaab104=this.get("eaab104");    //生日E
	  		
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
	  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
	  				.append("  from syscode a,syscode b, ab01 x")
	  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
	  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aab102))
	  		{
	  			sql.append(" and x.aab102 like ?");
	  			paramList.add("%"+aab102+"%");
	  		}
	  		if(this.isNotNull(aab103))
	  		{
	  			sql.append(" and x.aab103=?");
	  			paramList.add(aab103);
	  		}
	  		if(this.isNotNull(aab105))
	  		{
	  			sql.append(" and x.aab105=?");
	  			paramList.add(aab105);
	  		}
	  		if(this.isNotNull(aab106))
	  		{
	  			sql.append(" and x.aab106=?");
	  			paramList.add(aab106);
	  		}
	  		if(this.isNotNull(baab104))
	  		{
	  			sql.append(" and x.aab104>=?");
	  			paramList.add(baab104);
	  		}
	  		if(this.isNotNull(eaab104))
	  		{
	  			sql.append(" and x.aab104<=?");
	  			paramList.add(eaab104);
	  		}
	  		
	  		sql.append(" order by x.aab102");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
    
	  public List<Map<String,String>> userHistoryQuery()throws Exception
	  {
	  		//还原页面查询条件
	  		Object aab104=this.get("qaab104");		//商家名
	  		Object aac102=this.get("qaac102");     	//订座日期
	  		Object aac103=this.get("qaac103");     	//用餐日期
	  		Object aac104=this.get("qaac104");     	//人数
	  		Object aac105=this.get("qaac105");     	//订座号
	  		Object aaa202=this.get("qaaa202");     	//口味
	  		Object aaa203=this.get("qaaa203");     	//菜系
	  		Object aaa204=this.get("qaaa204");     	//种类
	  		Object aaa205=this.get("qaaa205");     	//设备
	  		Object aaa206=this.get("qaaa206");     	//位置
	  		
	  		//定义SQL主体
//	  		select aaa102,aaa103,aab104,aac102,aac103,aac104,aac105,aaa202,aaa203,aaa204,aaa205,aaa206
//	  		from aa01 a,ab01 b,ac01 c,aa02 d
//	  		where a.aaa101=c.aaa101 and b.aab101=c.aab101 and c.aaa201=d.aaa201 and a.aaa101=d.aaa101
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aaa102,aaa103,aab104,aac101,aac102,")
	  				.append("       aac103,aac104,aac105,aaa202,aaa203,")
	  				.append("       aaa204,aaa205,aaa206,aaa207")
	  				.append("  from aa01 a,ab01 b,ac01 c,aa02 d")
	  				.append(" where a.aaa101=c.aaa101 and b.aab101=c.aab101")
	  				.append("   and c.aaa201=d.aaa201 and a.aaa101=d.aaa101") 
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aac102))
	  		{
	  			sql.append(" and c.aac102=?");
	  			paramList.add(aac102);
	  		}
	  		if(this.isNotNull(aab104))
	  		{
	  			sql.append(" and b.aab104 like ?");
	  			paramList.add("%"+aab104+"%");
	  		}
	  		if(this.isNotNull(aac103))
	  		{
	  			sql.append(" and c.aac103=?");
	  			paramList.add(aac103);
	  		}
	  		if(this.isNotNull(aac104))
	  		{
	  			sql.append(" and c.aac104=?");
	  			paramList.add(aac104);
	  		}
	  		if(this.isNotNull(aac105))
	  		{
	  			sql.append(" and c.aac105=?");
	  			paramList.add(aac105);
	  		}
	  		if(this.isNotNull(aaa202))
	  		{
	  			sql.append(" and d.aaa202=?");
	  			paramList.add(aaa202);
	  		}
	  		if(this.isNotNull(aaa203))
	  		{
	  			sql.append(" and d.aaa203=?");
	  			paramList.add(aaa203);
	  		}
	  		if(this.isNotNull(aaa204))
	  		{
	  			sql.append(" and d.aaa204=?");
	  			paramList.add(aaa204);
	  		}
	  		if(this.isNotNull(aaa205))
	  		{
	  			sql.append(" and d.aaa205=?");
	  			paramList.add(aaa205);
	  		}
	  		if(this.isNotNull(aaa206))
	  		{
	  			sql.append(" and d.aaa206 like ?");
	  			paramList.add("%"+aaa206+"%");
	  		}
	  		
	  		sql.append(" order by c.aac102");
	  		//System.out.println(sql.toString());
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	  
	  public List<Map<String,String>> adminNoticeQuery()throws Exception
	  {
	  		//还原页面查询条件
	  		Object aac203=this.get("qaac203");		//发布日期
	  		Object aac402=this.get("qaac402");     	//发布人工号
	  		Object aac202=this.get("qaac202");     	//标题
	  		Object aac206=this.get("qaac206");     	//种类
	  		Object aac207=this.get("qaac206");     	//优先级
	  		
	  		//定义SQL主体
//	  		select aaa102,aaa103,aab104,aac102,aac103,aac104,aac105,aaa202,aaa203,aaa204,aaa205,aaa206
//	  		from aa01 a,ab01 b,ac01 c,aa02 d
//	  		where a.aaa101=c.aaa101 and b.aab101=c.aab101 and c.aaa201=d.aaa201 and a.aaa101=d.aaa101
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac201,aac203,aac202,aac206,aac207")
	  				.append("  from ac02 a,ac04 b")
	  				.append(" where a.aac401=b.aac401")
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aac203))
	  		{
	  			sql.append(" and a.aac203=?");
	  			paramList.add(aac203);
	  		}
	  		if(this.isNotNull(aac402))
	  		{
	  			sql.append(" and b.aac402=?");
	  			paramList.add(aac402);
	  		}
	  		if(this.isNotNull(aac202))
	  		{
	  			sql.append(" and a.aac202 like ?");
	  			paramList.add("%"+aac202+"%");
	  		}
	  		if(this.isNotNull(aac206))
	  		{
	  			sql.append(" and a.aac206=?");
	  			paramList.add(aac206);
	  		}
	  		if(this.isNotNull(aac207))
	  		{
	  			sql.append(" and a.aac207=?");
	  			paramList.add(aac207);
	  		}
	  		
	  		sql.append(" order by a.aac203");
	  		//System.out.println(sql.toString());
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	  
	  public List<Map<String,String>> userNoticeQuery()throws Exception
	  {
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac201,aac203,aac202,aac206,aac207")
	  				.append("  from ac02")
	  				;
	  		
	  		sql.append(" order by aac203,aac207 desc");
	  		//System.out.println(sql.toString());
	  		return this.queryForList(sql.toString());
	  }
	  
	  public List<Map<String,String>> adminBusinessQuery()throws Exception
	  {
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aab101,aab102,aab104,aab108")
	  				.append("  from ab01")
	  				.append(" where aab105=0")
	  				;
	  		
	  		sql.append(" order by aab101");
	  		//System.out.println(sql.toString());
	  		return this.queryForList(sql.toString());
	  }
	  /*
	     * �̼��û���¼
	     * (non-Javadoc)
	     * @see com.neusoft.services.BaseServices#busiLogin()
	     */
		  public Map<String, String> busiLogin()throws Exception
		    {
		    	
		    	//StringBuilder sql=new StringBuilder("select a from ab01 where a.aab102=? and a.aab103=?");
		    	StringBuilder sql=new StringBuilder()
		    			.append("select a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
		    			.append("       a.aab107,a.aab108,a.aab109,a.aab110,a.aab111,")
		    			.append("       a.aab112")
		    			.append("  from ab01 a")
		    			.append(" where a.aab102=?")
		    			.append(" and a.aab103=?")
		    			;
		    	Object args[]={
		    			this.get("aab102"),
		    			this.get("aab103")
		    	};
		        return this.queryForMap(sql.toString(), args);	
		   }
		 //�̼�ע��
		 private boolean busiRegister()throws Exception
		 {
		    //1.��дSQL���
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
		    		.append("                 aab107,aab108,aab109,aab110,aab111,")
		   			.append("                 aab112,aab113,aab114)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?,?,?,?,?,")
		   			.append("                 ?,?,?)")
		   			;
		  	//2.��д��������
		    	Object args[]=
		    	{
		    		this.get("aab102"),
		   			this.get("aab103"),
		   			this.get("aab104"),
		   			"0",
		   			this.get("aab106"),
		   			this.get("aab107"),
		   			"null",
		   			"null",
		   			"0",
		   			"0.0",
		   			"null",
		   			"null",
		   			"0"
		    	};
		    	return this.executeUpdate(sql.toString(), args)>0;	
		    }
		 //�̼�ע���Զ��ϴ���Ϣ��aa06(������)
		 private boolean insertAa06()throws Exception
		 {
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into aa06(aaa101,aab101,aaa602,aaa603)")
		    		.append("values			(?,?,?,?)")
		   			;
		    	Object args[]=
		    	{
		    			"1",
		    			"1",
		    			"0",
		    			"2000-01-01"
		    	};
		    	return this.executeUpdate(sql.toString(), args)>0;	
		    }
		 //�̼�ע���Զ��ϴ���ab04(������)
		 private boolean insertAb04()throws Exception
		 {
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into ab04(aab101,aab402,aab403,aab404)")
		    		.append("values			(?,?,?,?)")
		   			;
		    	Object args[]=
		    	{
		    			"1",
		    			"0",
		    			"2016-01-01",
		    			"2017-02-03"
		    	};
		    	return this.executeUpdate(sql.toString(), args)>0;	
		    }
		 //商家修改信息
		 private boolean busiModify()throws Exception
		    {
		    	StringBuilder sql=new StringBuilder()
		    			.append("update ab01 a")
		    			.append("   set a.aab103=?,a.aab104=?,a.aab105=?,a.aab106=?,a.aab107=?,")
		    			.append("       a.aab108=?,a.aab109=?,a.aab110=?,a.aab111=?,a.aab112=?,")
		    			.append("       a.aab113=?,a.aab114=?")
		    			.append(" where a.aab101=?")
		    			;
		    	Object args[]={
		    			this.get("aab103"),
		    			this.get("aab104"),
		    			this.get("aab105"),
		    			this.get("aab106"),
		    			this.get("aab107"),
		    			this.get("aab108"),
		    			this.get("aab109"),
		    			this.get("aab110"),
		    			this.get("aab111"),
		    			this.get("aab112"),
		    			this.get("aab113"),
		    			this.get("aab114"),
		    			this.get("aab101")
		    	};
		    	return this.executeUpdate(sql.toString(), args)>0;
		    }
		//单例查询商家数据
		 public Map<String,String> findBusiPopularizeById()throws Exception
		    {
		    	
		    	StringBuilder sql=new StringBuilder()
		    			.append("select a.aab401,a.aab101,a.aab402,a.aab403,a.aab404")
		    			.append("  from ab04 a")
		    			.append(" where a.aab101=?")
		    			;
		    	return this.queryForMap(sql.toString(), this.get("aab101"));
		    }
		 //商家推广1(aab402=0)
		 private boolean busiPopularize()throws Exception
		 {
			
			 StringBuilder sql=new StringBuilder()
		    			.append("UPDATE ab04 SET aab404 = DATE_ADD(aab404,INTERVAL ? MONTH)")
		    			.append(" WHERE aab101 = ?")
		    			;
		    	Object args[]=
		    		{
		    			this.get("popularizeMonth"),
		    			this.get("aab101")
		    		};
			return this.executeUpdate(sql.toString(), args)>0;
		 }
		 //商家推广(aab402=1)
		 private boolean busiContinuePopularize()throws Exception
		 {
			
			 StringBuilder sql=new StringBuilder()
		    			.append("UPDATE ab04 SET aab404 = DATE_ADD(CURRENT_DATE,INTERVAL ? MONTH)")
		    			.append(" WHERE aab101 = ?")
		    			;
		    	Object args[]=
		    		{
		    			this.get("popularizeMonth"),
		    			this.get("aab101")
		    		};
			return this.executeUpdate(sql.toString(), args)>0;
		 }
		 //商家添加菜单
		 private boolean busiAddDish()throws Exception
		 {
		    //1.定义sql语句
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into ab02(aab101,aab202,aab207,aab203,aab204,")
		    		.append("				  aab205,aab206)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?,?)")
		   			;
		  	//2.定义数组
		    	Object args[]=
		    	{
		    		this.get("aab101"),
		    		this.get("aab202"),
		   			this.get("aab207"),
		   			this.get("aab203"),
	    			Tools.joinArray(this.get("aab204")),
	    			Tools.joinArray(this.get("aab205")),
	    			this.get("aab206")
		    	};
		    	return this.executeUpdate(sql.toString(), args)>0;	
		    }
		 //遍历syscode
		 public List<Map<String,String>> getSysco()throws Exception
		 {
			 StringBuilder sql=new StringBuilder()
					 .append("select scode,sname,sfcode ")
					 .append("from syscode")
					 ;
			 return this.queryForList(sql.toString());
		 }
		 //商家查询自己的菜单
		 public List<Map<String,String>> busiDishMenuQuery()throws Exception
		 {
			 StringBuilder sql=new StringBuilder()
					 .append("select a.aab201,a.aab101,a.aab207,a.aab202,a.aab203,a.aab204,a.aab205,a.aab206 ")
					 .append("FROM ab02 a ")
					 .append("where a.aab101 = ? ")
					 ;
			 List<Map<String,String>> tems = this.queryForList(sql.toString(), this.get("aab101"));
			 for (int i = 0; i < tems.size(); i++) 
			 	{
			        tems.get(i).put("qaab204", tems.get(i).get("aab204"));
			        tems.get(i).put("qaab205", tems.get(i).get("aab205"));
			        tems.get(i).put("qaab206", tems.get(i).get("aab206"));
			        //获取一条口味并把代码替换为中文
			        parseBusiCodeList(tems.get(i),"aab204");
			        parseBusiCodeList(tems.get(i),"aab205");
			        parseBusiCodeList(tems.get(i),"aab206");
			    }
			    return tems;
		 }
		 //将商家菜品中的口味,菜系由编号转化为名称
		 private String convertBusiCodeToName(String code, String labelName) throws Exception
		 {
			    String sql = "select sname from syscode where sfcode='"+labelName+"' and scode = '"+code+"'";
			    List<Map<String,String>> list =  this.queryForList(sql);
			    if(list.size() > 0)
			    {
			        return list.get(0).get("sname");
			    }
			    else 
			    {
			        return "";
			    }
		 }
		 
		 //将数组中的编码转换为名称
		 private void parseBusiCodeList(Map<String, String> tem, String labelName)throws Exception 
		 {
		    String[] elements = tem.get(labelName).split(",");
		    for(int i = 0; i < elements.length; i++)
		    {
		        elements[i] = convertBusiCodeToName(elements[i], labelName);
		    }
		    tem.put(labelName, Tools.joinArray(elements)) ;
		 }
		 //根据aab201单例删除菜单
		 private boolean busiDelDishById()throws Exception
		    {
		    	String sql="delete from ab02 where aab201=?";
		    	return this.executeUpdate(sql, this.get("aab201"))>0;
		    }
		 
		 
		 private boolean userAssembleApply()throws Exception
		 {
		    //1.编写SQL语句
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into aa05(aaa101,aab101,aaa502,aaa503,aaa504,")
		    		.append("                 aaa505)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?)")
		   			;
		  	//2.编写参数数组
		    	Object args[]=
		    	{
		    		this.get("aaa101"),
		   			this.get("aab101"),
		   			this.get("aaa502"),
		   			this.get("aaa503"),
		   			this.get("aaa504"),
		   			"1"
		    	};
		    	return this.executeUpdate(sql.toString(), args)>0;	
		    }
		 //拼座查询
		 public List<Map<String,String>> userAssemble()throws Exception
		  {
		  		//还原页面查询条件
		  		Object aab104=this.get("qaab104");     //店铺名 模糊查询
		  		Object aaa103=this.get("qaaa103");     //拼座发起人 模糊查询
		  		Object aaa504=this.get("qaaa504");     //拼座人数
		  		Object aaa502=this.get("qaaa502");     //拼座开始时间
		  		Object aaa503=this.get("qaaa503");     //拼座结束时间
		  		
		  		//定义SQL主体
		  		StringBuilder sql=new StringBuilder()
		  				.append("select	a.aab101,a.aab104,a.aab105,b.aaa101,b.aab101,")
		  				.append("		b.aaa502,b.aaa503,b.aaa504,b.aaa505,c.aaa101,")
		  				.append("		c.aaa102,c.aaa103")
		  				.append(" from 	ab01 a,aa05 b,aa01 c")
		  				.append(" where	a.aab101=b.aab101 and c.aaa101=b.aaa101")
		  				;
		  		
		  		//参数列表
		  		List<Object> paramList=new ArrayList<>();
		  		//逐一判断查询条件是否录入,拼接AND条件
		  		if(this.isNotNull(aab104))
		  		{
		  			sql.append(" and a.aab104 like ?");
		  			paramList.add("%"+aab104+"%");
		  		}
		  		if(this.isNotNull(aaa103))
		  		{
		  			sql.append(" and c.aab103 like ?");
		  			paramList.add("%"+aab104+"%");
		  		}
		  		if(this.isNotNull(aaa504))
		  		{
		  			sql.append(" and b.aab105=?");
		  			paramList.add(aaa504);
		  		}
		  		if(this.isNotNull(aaa502))
		  		{
		  			sql.append(" and b.aaa502>=?");
		  			paramList.add(aaa502);
		  		}
		  		if(this.isNotNull(aaa503))
		  		{
		  			sql.append(" and b.aaa503<=?");
		  			paramList.add(aaa503);
		  		}
		  		
		  		sql.append(" order by a.aab104");
		  		return this.queryForList(sql.toString(), paramList.toArray());
		  }
		 
		 
		 
		 //商家菜单条件查询
		 public List<Map<String,String>> busiQuery()throws Exception
		  {
		  		//
		  		Object aab102=this.get("qaab102");     //
		  		Object aab103=this.get("qaab103");     //
		  		Object aab105=this.get("qaab105");     //
		  		Object aab106=this.get("qaab106");     //
		  		Object baab104=this.get("baab104");    //
		  		Object eaab104=this.get("eaab104");    //
		  		
		  		//
		  		StringBuilder sql=new StringBuilder()
		  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
		  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
		  				.append("  from syscode a,syscode b, ab01 x")
		  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
		  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
		  				;
		  		
		  		//
		  		List<Object> paramList=new ArrayList<>();
		  		//
		  		if(this.isNotNull(aab102))
		  		{
		  			sql.append(" and x.aab102 like ?");
		  			paramList.add("%"+aab102+"%");
		  		}
		  		if(this.isNotNull(aab103))
		  		{
		  			sql.append(" and x.aab103=?");
		  			paramList.add(aab103);
		  		}
		  		if(this.isNotNull(aab105))
		  		{
		  			sql.append(" and x.aab105=?");
		  			paramList.add(aab105);
		  		}
		  		if(this.isNotNull(aab106))
		  		{
		  			sql.append(" and x.aab106=?");
		  			paramList.add(aab106);
		  		}
		  		if(this.isNotNull(baab104))
		  		{
		  			sql.append(" and x.aab104>=?");
		  			paramList.add(baab104);
		  		}
		  		if(this.isNotNull(eaab104))
		  		{
		  			sql.append(" and x.aab104<=?");
		  			paramList.add(eaab104);
		  		}
		  		
		  		sql.append(" order by x.aab102");
		  		return this.queryForList(sql.toString(), paramList.toArray());
		  }
}
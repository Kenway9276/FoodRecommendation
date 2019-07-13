package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

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
    	//1.缂栧啓SQL璇彞
    	StringBuilder sql=new StringBuilder()
    			.append("insert into aa01(aaa102,aaa103,aaa104,aaa105,aaa106,")
    			.append("                 aaa107,aaa108,aaa110)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,CURRENT_DATE)")
    			;
    	//2.缂栧啓鍙傛暟鏁扮粍
    	Object args[]={
    			this.get("aaa102"),
       			this.get("aaa103"),
    			this.get("aaa104"),
    			Tools.getMd5(this.get("aaa105")),
    			this.get("aaa106"),
    			this.get("aaa107"),
    			this.get("aaa108"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    private boolean adminReleaseNotice()throws Exception
    {
    	Object aac204 ="upload/" + this.get("imgPath");
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac02(aac202,aac203,aac204,aac205,aac206,")
    			.append("                 aac207,aac401)")
    			.append("          values(?,CURRENT_TIMESTAMP,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.缂栧啓鍙傛暟鏁扮粍
    	Object args[]={
    			this.get("aac202"),
    			aac204,
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
    			.append(" where aaa102=? and aaa105=?")
    			;
    	Object args[]={
    			this.get("aaa103"),
    			this.get("aaa104"),
    			Tools.getMd5(this.get("raaa105")),
    			this.get("aaa106"),
    			this.get("aaa107"),
    			this.get("aaa108"),
    			this.get("aaa110"),
    			this.get("aaa102"),
    			Tools.getMd5(this.get("aaa105"))
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
   public Map<String, String> userLogin()throws Exception
    {
		StringBuilder sql=new StringBuilder("select * from aa01 where aaa102=? and aaa105=?");
    	Object args[]={
    			this.get("aaa102"),
    			Tools.getMd5(this.get("aaa105")),
    	};
    	return this.queryForMap(sql.toString(), args);
    }
    
    private boolean addEmp()throws Exception
    {
    	//鑾峰彇褰撳墠鍛樺伐缂栧彿
    	String aab103=Tools.getEmpNumber();
    	//鍚慏TO娣诲姞鍛樺伐缂栧彿
    	this.put("aab103", aab103);
    	
    	//1.缂栧啓SQL璇彞
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
    			.append("                 aab107,aab108,aab109,aab110,aab111,")
    			.append("                 aab112,aab113)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.缂栧啓鍙傛暟鏁扮粍
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
    	//1.瀹氫箟SQL璇彞
    	String sql="delete from ab01 where aab101=?";
    	//2.鑾峰彇椤甸潰idlist鏁扮粍
    	String idlist[]=this.getIdList("idlist");
    	//3.鎵ц
    	return this.batchUpdate(sql, idlist);
    }
    
    private boolean userHistoryDelete()throws Exception
    {
    	//1.瀹氫箟SQL璇彞
    	String sql="delete from ac01 where aac101=?";
    	//2.鑾峰彇椤甸潰idlist鏁扮粍
    	String idlist[]=this.getIdList("idlist");
    	//3.鎵ц
    	return this.batchUpdate(sql, idlist);
    }
    
    private boolean adminNoticeDelete()throws Exception
    {
    	//1.瀹氫箟SQL璇彞
    	String sql="delete from ac02 where aac201=?";
    	//2.鑾峰彇椤甸潰idlist鏁扮粍
    	String idlist[]=this.getIdList("idlist");
    	//3.鎵ц
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
    	//1.缂栧啓SQL璇彞
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
    			.append("       a.aab107,a.aab108,a.aab109,a.aab110,a.aab111,")
    			.append("       a.aab112,a.aab113")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?")
    			;
    	//鎵ц鏌ヨ
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
    public Map<String,String> findByIdNotice()throws Exception
    {
    	//1.缂栧啓SQL璇彞
    	StringBuilder sql=new StringBuilder()
    			.append("select aac202,aac203,aac204,aac205,")
    			.append("       aac206,aac207")
    			.append("  from ac02")
    			.append(" where aac201=?")
    			;
    	//鎵ц鏌ヨ
    	return this.queryForMap(sql.toString(), this.get("aac201"));
    }
    
    
      /**
       * 涓嶅畾鏉′欢鏌ヨ
       * @return
       * @throws Exception
       */
	  public List<Map<String,String>> query()throws Exception
	  {
	  		//杩樺師椤甸潰鏌ヨ鏉′欢
	  		Object aab102=this.get("qaab102");     //濮撳悕  妯＄硦鏌ヨ
	  		Object aab103=this.get("qaab103");     //缂栧彿
	  		Object aab105=this.get("qaab105");     //鎬у埆
	  		Object aab106=this.get("qaab106");     //姘戞棌
	  		Object baab104=this.get("baab104");    //鐢熸棩B
	  		Object eaab104=this.get("eaab104");    //鐢熸棩E
	  		
	  		//瀹氫箟SQL涓讳綋
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
	  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
	  				.append("  from syscode a,syscode b, ab01 x")
	  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
	  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
	  				;
	  		
	  		//鍙傛暟鍒楄〃
	  		List<Object> paramList=new ArrayList<>();
	  		//閫愪竴鍒ゆ柇鏌ヨ鏉′欢鏄惁褰曞叆,鎷兼帴AND鏉′欢
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
	  		//杩樺師椤甸潰鏌ヨ鏉′欢
	  		Object aab104=this.get("qaab104");		//鍟嗗鍚�
	  		Object aac102=this.get("qaac102");     	//璁㈠骇鏃ユ湡
	  		Object aac103=this.get("qaac103");     	//鐢ㄩ鏃ユ湡
	  		Object aac104=this.get("qaac104");     	//浜烘暟
	  		Object aac105=this.get("qaac105");     	//璁㈠骇鍙�
	  		Object aaa202=this.get("qaaa202");     	//鍙ｅ懗
	  		Object aaa203=this.get("qaaa203");     	//鑿滅郴
	  		Object aaa204=this.get("qaaa204");     	//绉嶇被
	  		Object aaa205=this.get("qaaa205");     	//璁惧
	  		Object aaa206=this.get("qaaa206");     	//浣嶇疆
	  		
	  		//瀹氫箟SQL涓讳綋
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
	  		
	  		//鍙傛暟鍒楄〃
	  		List<Object> paramList=new ArrayList<>();
	  		//閫愪竴鍒ゆ柇鏌ヨ鏉′欢鏄惁褰曞叆,鎷兼帴AND鏉′欢
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
	  		//杩樺師椤甸潰鏌ヨ鏉′欢
	  		Object aac203=this.get("qaac203");		//鍙戝竷鏃ユ湡
	  		Object aac402=this.get("qaac402");     	//鍙戝竷浜哄伐鍙�
	  		Object aac202=this.get("qaac202");     	//鏍囬
	  		Object aac206=this.get("qaac206");     	//绉嶇被
	  		Object aac207=this.get("qaac206");     	//浼樺厛绾�
	  		
	  		//瀹氫箟SQL涓讳綋
//	  		select aaa102,aaa103,aab104,aac102,aac103,aac104,aac105,aaa202,aaa203,aaa204,aaa205,aaa206
//	  		from aa01 a,ab01 b,ac01 c,aa02 d
//	  		where a.aaa101=c.aaa101 and b.aab101=c.aab101 and c.aaa201=d.aaa201 and a.aaa101=d.aaa101
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac201,aac203,aac202,aac206,aac207")
	  				.append("  from ac02 a,ac04 b")
	  				.append(" where a.aac401=b.aac401")
	  				;
	  		
	  		//鍙傛暟鍒楄〃
	  		List<Object> paramList=new ArrayList<>();
	  		//閫愪竴鍒ゆ柇鏌ヨ鏉′欢鏄惁褰曞叆,鎷兼帴AND鏉′欢
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
	     * 锟教硷拷锟矫伙拷锟斤拷录
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
		 //锟教硷拷注锟斤拷
		 private boolean busiRegister()throws Exception
		 {
		    //1.锟斤拷写SQL锟斤拷锟�
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
		    		.append("                 aab107,aab108,aab109,aab110,aab111,")
		   			.append("                 aab112,aab113,aab114)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?,?,?,?,?,")
		   			.append("                 ?,?,?)")
		   			;
		  	//2.锟斤拷写锟斤拷锟斤拷锟斤拷锟斤拷
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
		 //锟教硷拷注锟斤拷锟皆讹拷锟较达拷锟斤拷息锟斤拷aa06(锟斤拷锟斤拷锟斤拷)
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
		 //锟教硷拷注锟斤拷锟皆讹拷锟较达拷锟斤拷ab04(锟斤拷锟斤拷锟斤拷)
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
		 //鍟嗗淇敼淇℃伅
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
		//鍗曚緥鏌ヨ鍟嗗鏁版嵁
		 public Map<String,String> findBusiPopularizeById()throws Exception
		    {
		    	
		    	StringBuilder sql=new StringBuilder()
		    			.append("select a.aab401,a.aab101,a.aab402,a.aab403,a.aab404")
		    			.append("  from ab04 a")
		    			.append(" where a.aab101=?")
		    			;
		    	return this.queryForMap(sql.toString(), this.get("aab101"));
		    }
		 //鍟嗗鎺ㄥ箍1(aab402=0)
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
		 //鍟嗗鎺ㄥ箍(aab402=1)
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
		 //鍟嗗娣诲姞鑿滃崟
		 private boolean busiAddDish()throws Exception
		 {
		    //1.瀹氫箟sql璇彞
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into ab02(aab101,aab202,aab207,aab203,aab204,")
		    		.append("				  aab205,aab206)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?,?)")
		   			;
		  	//2.瀹氫箟鏁扮粍
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
		 //閬嶅巻syscode
		 public List<Map<String,String>> getSysco()throws Exception
		 {
			 StringBuilder sql=new StringBuilder()
					 .append("select scode,sname,sfcode ")
					 .append("from syscode")
					 ;
			 return this.queryForList(sql.toString());
		 }
		 //鍟嗗鏌ヨ鑷繁鐨勮彍鍗�
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
			        //鑾峰彇涓�鏉″彛鍛冲苟鎶婁唬鐮佹浛鎹负涓枃
			        parseBusiCodeList(tems.get(i),"aab204");
			        parseBusiCodeList(tems.get(i),"aab205");
			        parseBusiCodeList(tems.get(i),"aab206");
			    }
			    return tems;
		 }
		 //灏嗗晢瀹惰彍鍝佷腑鐨勫彛鍛�,鑿滅郴鐢辩紪鍙疯浆鍖栦负鍚嶇О
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
		 
		 //灏嗘暟缁勪腑鐨勭紪鐮佽浆鎹负鍚嶇О
		 private void parseBusiCodeList(Map<String, String> tem, String labelName)throws Exception 
		 {
		    String[] elements = tem.get(labelName).split(",");
		    for(int i = 0; i < elements.length; i++)
		    {
		        elements[i] = convertBusiCodeToName(elements[i], labelName);
		    }
		    tem.put(labelName, Tools.joinArray(elements)) ;
		 }
		 //鏍规嵁aab201鍗曚緥鍒犻櫎鑿滃崟
		 private boolean busiDelDishById()throws Exception
		    {
		    	String sql="delete from ab02 where aab201=?";
		    	return this.executeUpdate(sql, this.get("aab201"))>0;
		    }
		 
		 
		 private boolean userAssembleApply()throws Exception
		 {
		    //1.缂栧啓SQL璇彞
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into aa05(aaa101,aab101,aaa502,aaa503,aaa504,")
		    		.append("                 aaa505)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?)")
		   			;
		  	//2.缂栧啓鍙傛暟鏁扮粍
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
		 //鎷煎骇鏌ヨ
		 public List<Map<String,String>> userAssemble()throws Exception
		  {
		  		//杩樺師椤甸潰鏌ヨ鏉′欢
		  		Object aab104=this.get("qaab104");     //搴楅摵鍚� 妯＄硦鏌ヨ
		  		Object aaa103=this.get("qaaa103");     //鎷煎骇鍙戣捣浜� 妯＄硦鏌ヨ
		  		Object aaa504=this.get("qaaa504");     //鎷煎骇浜烘暟
		  		Object aaa502=this.get("qaaa502");     //鎷煎骇寮�濮嬫椂闂�
		  		Object aaa503=this.get("qaaa503");     //鎷煎骇缁撴潫鏃堕棿
		  		
		  		//瀹氫箟SQL涓讳綋
		  		StringBuilder sql=new StringBuilder()
		  				.append("select	a.aab101,a.aab104,a.aab105,b.aaa101,b.aab101,")
		  				.append("		b.aaa502,b.aaa503,b.aaa504,b.aaa505,c.aaa101,")
		  				.append("		c.aaa102,c.aaa103")
		  				.append(" from 	ab01 a,aa05 b,aa01 c")
		  				.append(" where	a.aab101=b.aab101 and c.aaa101=b.aaa101")
		  				;
		  		
		  		//鍙傛暟鍒楄〃
		  		List<Object> paramList=new ArrayList<>();
		  		//閫愪竴鍒ゆ柇鏌ヨ鏉′欢鏄惁褰曞叆,鎷兼帴AND鏉′欢
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
		 
		 
		 
		 //鍟嗗鑿滃崟鏉′欢鏌ヨ
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
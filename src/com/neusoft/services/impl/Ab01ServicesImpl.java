package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.BBSTools;
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
    
    private boolean busiNotPass()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01")
    			.append("   set aab105=?")
    			.append(" where aab101=?")
    			;
    	Object args[]={
    			"0",
    			this.get("aab101"),
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    private boolean adminModify()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ac04")
    			.append("   set aac404=?,aac405=?")
    			.append(" where aac401=?")
    			;
    	Object args[]={
    			Tools.getMd5(this.get("aac404")),
    			this.get("aac405"),
    			this.get("aac401")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    private boolean adminNoticeModify()throws Exception
    {
	   	Object imgPath =this.get("imgPath");
    	StringBuilder sql=new StringBuilder()
    			.append("update ac02")
    			.append("   set aac202=?,aac205=?,aac206=?,aac207=?")
    			;
    	List<Object> arr=new ArrayList<>();
    	arr.add(this.get("aac202"));
    	arr.add(this.get("aac205"));
    	arr.add(this.get("aac206"));
    	arr.add(this.get("aac207"));
    	if (imgPath != null) 
    	{
    		sql.append(",aac204=?");
    		Object aac204 ="upload/" + imgPath;
    	   	arr.add(aac204);
    	}
		sql.append(" where aac201=?");
    	arr.add(this.get("aac201"));
    	return this.executeUpdate(sql.toString(), arr.toArray())>0;
    	
    }
    
    private boolean userRegister()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("insert into aa01(aaa102,aaa103,aaa104,aaa105,aaa106,")
    			.append("                 aaa107,aaa108,aaa110)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,CURRENT_DATE)")
    			;
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
    
    private String userNameCheck() throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select aaa102 from aa01 ")
    			.append("where  aaa102=?")
    			;
    	Gson gson = new Gson();
    	if(this.queryForMap(sql.toString(), this.get("aaa102"))==null){
    		String msg = "{\"msg\":1}";
    		Map<String, String> map = new HashMap<>();
    		map.put("msg", "1");
    		String json = gson.toJson(map);
			System.out.println(json);
    		return json;
		}
    	else {
			String msg = "{\"msg\":0}";
			Map<String, String> map = new HashMap<>();
			map.put("msg", "0");
			String json = gson.toJson(map);
			System.out.println(json);
			return json;
		}
    }
    
    private boolean adminReleaseNotice()throws Exception
    {
    	Object aac204 ="upload/" + this.get("imgPath");

        String text = (String) this.get("aac205");
        text = BBSTools.parseBBSText(text, this.get("filePath") + "\\");
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac02(aac202,aac203,aac204,aac205,aac206,")
    			.append("                 aac207,aac401)")
    			.append("          values(?,CURRENT_TIMESTAMP,?,?,?,")
    			.append("                 ?,?)")
    			;

    	Object args[]={
    			this.get("aac202"),
    			aac204,
    			text,
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
    			.append("       aaa107=?,aaa108=?")
    			.append(" where aaa102=? and aaa105=?")
    			;
    	Object args[]={
    			this.get("aaa103"),
    			this.get("aaa104"),
    			Tools.getMd5(this.get("raaa105")),
    			this.get("aaa106"),
    			this.get("aaa107"),
    			this.get("aaa108"),
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
    	//闂備礁鍚嬮崕鎶藉床閼艰翰浜归柛銉簵娴滃綊鏌熼幆褍鏆辨い銈呮嚇閺屾稑鈽夊▍顓т簼鐎靛ジ骞囬鍓э紳闂佸搫璇為崘銊㈡瀼
    	String aab103=Tools.getEmpNumber();
    	//闂備礁鎲＄喊宥夊储閻氬尗婵犵數鍎戠紞锟芥い鏇嗗嫭鍙忛柣鎰惈瀹告繃淇婇婵囥�冪紒鎲嬬悼缁辨捇宕掑☉姘吂閻熸粌搴滈幏锟�
    	this.put("aab103", aab103);
    	
    	//1.缂傚倸鍊搁崐褰掓偋閺囥垹鐤柟缁樼磿L闂佽崵濮村ù鍌炲储閼硅埇浜归柨鐕傛嫹
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
    			.append("                 aab107,aab108,aab109,aab110,aab111,")
    			.append("                 aab112,aab113)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.缂傚倸鍊搁崐褰掓偋閺囥垹鐤柟鎹愵嚙閻鏌涚仦鍓р檨婵炲牆鐖奸弻鈩冩媴閻熼偊妫嗙紓渚囧櫙閹凤拷
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
    	String sql="delete from ab01 where aab101=?";
    	String idlist[]=this.getIdList("idlist");
    	return this.batchUpdate(sql, idlist);
    }
    
    private boolean userHistoryDelete()throws Exception
    {
    	String sql="delete from ac01 where aac101=?";
    	String idlist[]=this.getIdList("idlist");
    	return this.batchUpdate(sql, idlist);
    }
    
    private boolean adminNoticeDelete()throws Exception
    {
    	String sql="delete from ac02 where aac201=?";
    	String idlist[]=this.getIdList("idlist");
    	return this.batchUpdate(sql, idlist);
    }
    
    private boolean adminCouponDelete()throws Exception
    {
    	String sql="delete from ab05 where aab501=?";
    	String idlist[]=this.getIdList("idlist");
    	return this.batchUpdate(sql, idlist);
    }
    
    private boolean adminPostDelete()throws Exception
    {
    	String sql="delete from aa03 where aaa301=?";
    	String idlist[]=this.getIdList("idlist");
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
    
    private boolean adminDeleteByIdPost()throws Exception
    {
    	String sql="delete from aa03 where aaa301=?";
    	return this.executeUpdate(sql, this.get("aaa301")) > 0;
    }
    
    private boolean adminDeleteByIdCoupon()throws Exception
    {
    	String sql="delete from ab05 where aab501=?";
    	return this.executeUpdate(sql, this.get("aab501")) > 0;
    }
    
    public Map<String, String> adminLogin()throws Exception
    {
		StringBuilder sql=new StringBuilder("select aac401,aac402,aac403,aac404,aac405,aac406 from ac04 where aac403=? and aac404=?");
    	Object args[]={
    			this.get("aac403"),
    			Tools.getMd5(this.get("aac404")),
    	};
    	return this.queryForMap(sql.toString(), args);
    }
    
    public Map<String,String> findById()throws Exception
    {
    	//1.缂傚倸鍊搁崐褰掓偋閺囥垹鐤柟缁樼磿L闂佽崵濮村ù鍌炲储閼硅埇浜归柨鐕傛嫹
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
    			.append("       a.aab107,a.aab108,a.aab109,a.aab110,a.aab111,")
    			.append("       a.aab112,a.aab113")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?")
    			;
    	//闂備礁婀遍悷鎶藉幢閳哄倹鏉搁梻浣告惈鐞氼偊宕曢幘顕呮晪闁跨噦鎷�
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
    public Map<String,String> findByIdNotice()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select aac201,aac202,aac203,aac204,aac205,")
    			.append("       aac206,aac207")
    			.append("  from ac02")
    			.append(" where aac201=?")
    			;
    	return this.queryForMap(sql.toString(), this.get("aac201"));
    }
    
    
      /**
       * 濠电偞鍨堕幐鍝ョ矓閹绢喗鍋╁Δ锝呭暙缁狙囨煃閵夈儱绾фい鎰矙閺岋紕浠︾拠鎻掑Г濡炪倖娲╅幏锟�
       * @return
       * @throws Exception
       */
	  public List<Map<String,String>> query()throws Exception
	  {
	  		//闂佸搫顦弲婊堟晪闁汇埄鍨奸崑鍛村Φ閸曨垱鍋ㄩ柛娑橈攻閵嗗啴姊洪崫鍕潶闁稿孩鎸抽、姘旈崨顓犻獓闂佺偨鍎卞鍫曨敃閿燂拷
	  		Object aab102=this.get("qaab102");     //濠电姵顔栭崰妤呭箰閹间礁绠栭柨鐕傛嫹  婵犵妲呴崹鐣屾閺囩姵鍏滈柨鏇炲�搁拑鐔兼煏婢舵鍘涢柛銈忔嫹
	  		Object aab103=this.get("qaab103");     //缂傚倸鍊搁崐褰掓偋閺嚶颁汗闁跨噦鎷�
	  		Object aab105=this.get("qaab105");     //闂備浇顕栭崕鎼佸礃閵娧冨Ц
	  		Object aab106=this.get("qaab106");     //婵犳鍠楄摫闁搞劏娉涜灋闁跨噦鎷�
	  		Object baab104=this.get("baab104");    //闂備焦鐪归崹濠氬窗閹邦儵娑㈠Υ閿燂拷
	  		Object eaab104=this.get("eaab104");    //闂備焦鐪归崹濠氬窗閹邦儵娑㈠Υ閿燂拷
	  		
	  		//闂佽姘﹂～澶愭儗椤斿墽涓嶉柣鎴犵潔L濠电偞鍨堕幑渚�顢欐繝鍕闁跨噦鎷�
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
	  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
	  				.append("  from syscode a,syscode b, ab01 x")
	  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
	  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
	  				;
	  		
	  		//闂備礁鎲￠悷銉╁磹瑜版帒姹查柣鏃傚帶缁�鍡樹繆閵堝懎顏ラ柨鐔告灮閹凤拷
	  		List<Object> paramList=new ArrayList<>();
	  		//闂傚倷绶￠崑鍛村礉閹烘梻鍗氶柟缁㈠枛缁�鍡涙煏閸繃顥為柣鎺嶇矙閺岋紕浠︾拠鎻掑Г濡炪倖娲橀〃濠傤嚕閸洖鐏抽柛娆忣樈閸嬨劑姊洪崫鍕伌闁搞劋鍗抽獮鍡樻媴婵劒姹楅梺鍝勬川閸嬫稑顕ｉ敓锟�,闂備胶鎳撻崲鏌ュ触鐎ｎ剚鏆滅痪鏉垮皰D闂備礁鎼ˇ顐︽晸閽樺绾фい鎰舵嫹
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
		  	Object aaa101=this.get("userID");
	  		Object aab104=this.get("qaab104");		
	  		Object aac102=this.get("qaac102");     	
	  		Object aac103=this.get("qaac103");     	
	  		Object aac104=this.get("qaac104");     	
	  		Object aac105=this.get("qaac105");     	
	  		Object aaa202=this.get("qaaa202");     	
	  		Object aaa203=this.get("qaaa203");     	
	  		Object aaa204=this.get("qaaa204");     	
	  		Object aaa205=this.get("qaaa205");     	
	  		Object aaa206=this.get("qaaa206");     	
//	  		select aaa102,aaa103,aab104,aac102,aac103,aac104,aac105,aaa202,aaa203,aaa204,aaa205,aaa206
//	  		from aa01 a,ab01 b,ac01 c,aa02 d
//	  		where a.aaa101=c.aaa101 and b.aab101=c.aab101 and c.aaa201=d.aaa201 and a.aaa101=d.aaa101
	  		StringBuilder sql=new StringBuilder()
	  				.append("select a.aaa102,a.aaa103,b.aab104,c.aac101,c.aac102,")
	  				.append("       c.aac103,c.aac104,c.aac105,d.aaa202,d.aaa203,")
	  				.append("       d.aaa204,d.aaa205,d.aaa206,d.aaa207,c.aac101")
	  				.append("  from aa01 a,ab01 b,ac01 c,aa02 d")
	  				.append(" where a.aaa101=c.aaa101 and b.aab101=c.aab101")
	  				.append("   and c.aaa201=d.aaa201 and a.aaa101=d.aaa101") 
	  				.append("   and c.aaa101=? and aac106=?") 
	  				;
	  		
	  		List<Object> paramList=new ArrayList<>();
	  		paramList.add(aaa101);
	  		paramList.add("1");
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
	  		
	  		sql.append(" order by c.aac102;");
	  		//System.out.println(sql.toString());
	  		List<Map<String, String>> tems = this.queryForList(sql.toString(), paramList.toArray());
	  		
	        for (int i = 0; i < tems.size(); i++) {
	            tems.get(i).put("qaaa204", tems.get(i).get("aaa204"));
	            tems.get(i).put("qaaa202", tems.get(i).get("aaa202"));
	            tems.get(i).put("qaaa203", tems.get(i).get("aaa203"));
	            //闁兼儳鍢茶ぐ鍥ㄧ▔閿熶粙寮堕垾鍏呯剨濠靛倽妫勯懟鐔煎箮婵犱礁鏁╅柣顔荤劍濞存盯骞戦～顓＄濞戞搩鍘介弸锟�
	            parseCodeList(tems.get(i),"aaa204");
	            parseCodeList(tems.get(i),"aaa202");
	            parseCodeList(tems.get(i),"aaa203");
	        }
	  		
	  		return tems;
	  }
	    
	    public void parseCodeList(Map<String, String> tem, String labelName)throws Exception {
	        String[] elements = tem.get(labelName).split(",");
	        for(int i = 0; i < elements.length; i++){
	            elements[i] = convertCodeToName(elements[i], labelName);
	        }
	        tem.put(labelName, Tools.joinArray(elements)) ;
	    }

	    /**
	     * 闁兼儳鍢茶ぐ鍣憏scode濞戞搩鍘洪崬顒勬儘娴ｅ壊鍤犻幖瀛樻⒒濞堟垶绋夐鐔哥��
	     * 婵絾鏌ㄩ々顪a203濞戞搫鎷�1閻庣數鎳撶花鑼矓娴ｇ懓鐓ｉ柤鍖℃嫹
	     * @param code
	     * @param labelName
	     * @return
	     * @throws Exception
	     */
	    private String convertCodeToName(String code, String labelName) throws Exception{
	        String sql = "select sname from syscode where sfcode='"+labelName+"' and scode = '"+code+"'";
	        List<Map<String,String>> list =  this.queryForList(sql);
	        if(list.size() > 0){
	            return list.get(0).get("sname");
	        }
	        else {
	            return "";
	        }
	    }
	  
	  public List<Map<String,String>> adminNoticeQuery()throws Exception
	  {
	  		//闂佸搫顦弲婊堟晪闁汇埄鍨奸崑鍛村Φ閸曨垱鍋ㄩ柛娑橈攻閵嗗啴姊洪崫鍕潶闁稿孩鎸抽、姘旈崨顓犻獓闂佺偨鍎卞鍫曨敃閿燂拷
	  		Object aac203=this.get("qaac203");		//闂備礁鎲￠悷锕傚垂閻㈢數鍗氶柣鎴ｆ缁秹鏌曟径娑㈡闁糕晪鎷�
	  		Object aac402=this.get("qaac402");     	//闂備礁鎲￠悷锕傚垂閻㈢數鍗氶梺鍨儑椤╂煡鏌涘┑鍡楊仹缂佹唻缍侀弻娑樷枎濞嗘劕顏�
	  		Object aac202=this.get("qaac202");     	//闂備礁鎼粔鏉懨洪鈧拷鍌炴晸閿燂拷
	  		Object aac206=this.get("qaac206");     	//缂傚倷绀侀ˇ顖滅矓閸撲焦鍋栭柨鐕傛嫹
	  		Object aac207=this.get("qaac207");     	//濠电偞娼欓崥瀣晪闂佸憡蓱缁嬫捇鎯�椤忓牊鏅搁柨鐕傛嫹
	  		System.out.println(aac206);
	  		//闂佽姘﹂～澶愭儗椤斿墽涓嶉柣鎴犵潔L濠电偞鍨堕幑渚�顢欐繝鍕闁跨噦鎷�
//	  		select aaa102,aaa103,aab104,aac102,aac103,aac104,aac105,aaa202,aaa203,aaa204,aaa205,aaa206
//	  		from aa01 a,ab01 b,ac01 c,aa02 d
//	  		where a.aaa101=c.aaa101 and b.aab101=c.aab101 and c.aaa201=d.aaa201 and a.aaa101=d.aaa101
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac201,aac203,aac202,aac206,aac207")
	  				.append("  from ac02 a,ac04 b")
	  				.append(" where a.aac401=b.aac401")
	  				;
	  		
	  		//闂備礁鎲￠悷銉╁磹瑜版帒姹查柣鏃傚帶缁�鍡樹繆閵堝懎顏ラ柨鐔告灮閹凤拷
	  		List<Object> paramList=new ArrayList<>();
	  		//闂傚倷绶￠崑鍛村礉閹烘梻鍗氶柟缁㈠枛缁�鍡涙煏閸繃顥為柣鎺嶇矙閺岋紕浠︾拠鎻掑Г濡炪倖娲橀〃濠傤嚕閸洖鐏抽柛娆忣樈閸嬨劑姊洪崫鍕伌闁搞劋鍗抽獮鍡樻媴婵劒姹楅梺鍝勬川閸嬫稑顕ｉ敓锟�,闂備胶鎳撻崲鏌ュ触鐎ｎ剚鏆滅痪鏉垮皰D闂備礁鎼ˇ顐︽晸閽樺绾фい鎰舵嫹
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
//	  		System.out.println(sql.toString());
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	  
	  public List<Map<String,String>> adminForumQuery()throws Exception
	  {
	  		Object baaa302=this.get("baaa302");		
	  		Object eaaa302=this.get("eaaa302");	
	  		Object aaa303=this.get("qaaa303");     	
	  		Object aaa304=this.get("qaaa304");     	   	
	  		Object aaa103=this.get("qaaa103");     	
	  		
//	  		select aaa102,aaa103,aab104,aac102,aac103,aac104,aac105,aaa202,aaa203,aaa204,aaa205,aaa206
//	  		from aa01 a,ab01 b,ac01 c,aa02 d
//	  		where a.aaa101=c.aaa101 and b.aab101=c.aab101 and c.aaa201=d.aaa201 and a.aaa101=d.aaa101
	  		StringBuilder sql=new StringBuilder()
	  				.append("select a.aaa301,a.aaa302,a.aaa303,a.aaa304,b.aaa103")
	  				.append("  from aa03 a,aa01 b")
	  				.append(" where a.aaa101=b.aaa101")
	  				;
	  		
	  		List<Object> paramList=new ArrayList<>();
	  		if(this.isNotNull(baaa302))
	  		{
	  			sql.append(" and a.aaa302>=?");
	  			paramList.add(baaa302);
	  		}
	  		if(this.isNotNull(eaaa302))
	  		{
	  			sql.append(" and a.aaa302<=?");
	  			paramList.add(eaaa302);
	  		}
	  		if(this.isNotNull(aaa303))
	  		{
	  			sql.append(" and a.aaa303 like ?");
	  			paramList.add("%"+aaa303+"%");
	  		}
	  		if(this.isNotNull(aaa304))
	  		{
	  			sql.append(" and a.aaa304 like ?");
	  			paramList.add("%"+aaa304+"%");
	  		}
	  		if(this.isNotNull(aaa103))
	  		{
	  			sql.append(" and b.aaa103 like ?");
	  			paramList.add("%"+aaa103+"%");
	  		}
	  		sql.append(" order by a.aaa301");
	  		//System.out.println(sql.toString());
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	  
	  public List<Map<String,String>> adminCouponQuery()throws Exception
	  {
	  		Object aab104=this.get("qaab104");		
	  		Object aab502=this.get("qaab502");	
	  		Object aab503=this.get("qaab503");     	
	  		Object aab504=this.get("qaab504");     	   	
	  		Object aab505=this.get("qaab505");   
	  		Object aab506=this.get("qaab506"); 
	  		
	  		StringBuilder sql=new StringBuilder()
	  				.append("select a.aab502,a.aab503,a.aab504,a.aab505,a.aab506,")
	  				.append("       b.aab104,b.aab101,a.aab501")
	  				.append("  from ab05 a,ab01 b")
	  				.append(" where a.aaa101 is null and a.aab101=b.aab101")
	  				;
	  		
	  		List<Object> paramList=new ArrayList<>();
	  		if(this.isNotNull(aab506))
	  		{
	  			sql.append(" and a.aab506<=?");
	  			paramList.add(aab506);
	  		}
	  		if(this.isNotNull(aab104))
	  		{
	  			sql.append(" and b.aab104 like ?");
	  			paramList.add("%"+aab104+"%");
	  		}
	  		if(this.isNotNull(aab502))
	  		{
	  			sql.append(" and a.aab502=?");
	  			paramList.add(aab502);
	  		}
	  		if(this.isNotNull(aab503))
	  		{
	  			sql.append(" and a.aab503 like ?");
	  			paramList.add("%"+aab503+"%");
	  		}
	  		if(this.isNotNull(aab504))
	  		{
	  			sql.append(" and a.aab504=?");
	  			paramList.add(aab504);
	  		}
	  		if(this.isNotNull(aab505))
	  		{
	  			sql.append(" and a.aab505 like ?");
	  			paramList.add(aab505);
	  		}
	  		sql.append(" order by a.aab501");
	  		//System.out.println(sql.toString());
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	  
	  public List<Map<String,String>> userNoticeQuery()throws Exception
	  {
	  		Object aaa101 = this.get("userID");
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac201,aac203,aac202,aac206,aac207")
	  				.append("  from ac02")
	  				;
	  		
	  		sql.append(" order by aac207 desc,aac203 desc");
	  		//System.out.println(sql.toString());
	  		return this.queryForList(sql.toString());
	  }
	  
	  public Map<String,String> userInfoQuery()throws Exception
	  {
		  	Object aaa101=this.get("userID");
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aaa101,aaa102,aaa103,aaa104,aaa105,aaa106,aaa107,aaa108,aaa110")
	  				.append("  from aa01")
	  				.append(" where aaa101=?")
	  				;
	  		
	  		//System.out.println(sql.toString());
	  		return this.queryForMap(sql.toString(),aaa101);
	  }
	  
	  public Map<String,String> adminInfoQuery()throws Exception
	  {
		  	Object aac401=this.get("adminID");
		  	System.out.println(this.get("adminID"));
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac401,aac402,aac403,aac404,aac405,aac406")
	  				.append("  from ac04")
	  				.append(" where aac401=?")
	  				;
	  		
	  		//System.out.println(sql.toString());
	  		return this.queryForMap(sql.toString(),aac401);
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
	     * 闂備浇娉曢崰鎰板汲閿熺晫鐥銏℃暠閻庢艾缍婇弻銊╂偄閾忕懓褰勬繛鏉戝悑閻燂妇锟芥艾缍婇弻銊╂偄閸涘﹦浼勯梺鐟板槻閸㈣尙绱為敓锟�
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
		 //闂備浇娉曢崰鎰板汲閿熺晫鐥銏℃暠閻庢氨鎳撻埢鏃堝Ω閳哄倹娅㈤梺鍝勫�堕崐鏍拷姘炬嫹
		 private boolean busiRegister()throws Exception
		 {
		    //1.闂備浇娉曢崰鎰板几婵犳艾绠�瑰嫭婢橀弲绐糛L闂備浇娉曢崰鎰板几婵犳艾绠柣鎴ｅГ閺呮悂鏌ㄩ悤鍌涘
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
		    		.append("                 aab107,aab108,aab109,aab110,aab111,")
		   			.append("                 aab112,aab113,aab114)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?,?,?,?,?,")
		   			.append("                 ?,?,?)")
		   			;
		  	//2.闂備浇娉曢崰鎰板几婵犳艾绠�瑰嫭婢橀弲鎼佹⒑鐠恒劌鏋戦柡瀣煼楠炲繘鎮滈懞銉︽闂佸搫鍊堕崐鏍拷姘秺閺屻劑鎮㈤崨濠勪紕闂佸綊顥撻崗姗�寮幘璇叉闁靛牆妫楅锟�
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
		 //闂備浇娉曢崰鎰板汲閿熺晫鐥銏℃暠閻庢氨鎳撻埢鏃堝Ω閳哄倹娅㈤梺鍝勫�堕崐鏍拷姘秺閺屻劑鎮㈤悜妯兼殾闁荤姳娴囬～澶岋拷姘秺閺屻劑鎮㈤懡銈囩崺闁哄鐗忛崑鎾讹拷姘秺閺屻劑鎮㈤崨濠勪紕闂佸湱鍏橀弨杈ㄥ閸涘瓨鐓ラ柣鏂挎啞閻忣噣鏌熸搴叄a06(闂備浇娉曢崰鎰板几婵犳艾绠柣鎴ｅГ閺呮悂鏌￠崒妯猴拷鏍拷姘秺閺屻劑鎮㈤崨濠勪紕闂佺懓鍤栭幏锟�)
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
		 //闂備浇娉曢崰鎰板汲閿熺晫鐥銏℃暠閻庢氨鎳撻埢鏃堝Ω閳哄倹娅㈤梺鍝勫�堕崐鏍拷姘秺閺屻劑鎮㈤悜妯兼殾闁荤姳娴囬～澶岋拷姘秺閺屻劑鎮㈤懡銈囩崺闁哄鐗忛崑鎾讹拷姘秺閺屻劑鎮㈤崨濠勪紕闂佸綊顥撻…顪�04(闂備浇娉曢崰鎰板几婵犳艾绠柣鎴ｅГ閺呮悂鏌￠崒妯猴拷鏍拷姘秺閺屻劑鎮㈤崨濠勪紕闂佺懓鍤栭幏锟�)
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
		 //闂備礁鎽滈崰搴∥涘Δ鍜佹晩鐎广儱妫涢埞宥嗐亜閺冨洤袚闁哄棭鍘艰彁闁搞儻绲芥晶鎻捗圭涵閿嬪
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
		 
		 private boolean adminPopById()throws Exception
		    {
		    	StringBuilder sql=new StringBuilder()
		    			.append("update ac02")
		    			.append("   set aac207=?")
		    			.append(" where aac201=?")
		    			;
		    	Object args[]={
		    			"1",
		    			this.get("aac201")
		    	};
		    	return this.executeUpdate(sql.toString(), args)>0;
		    }
		 
		 private boolean adminCancelById()throws Exception
		    {
		    	StringBuilder sql=new StringBuilder()
		    			.append("update ac02")
		    			.append("   set aac207=?")
		    			.append(" where aac201=?")
		    			;
		    	Object args[]={
		    			"0",
		    			this.get("aac201")
		    	};
		    	return this.executeUpdate(sql.toString(), args)>0;
		    }
		 
		//闂備礁鎲￠〃鍡椕洪幋鐘愁偨闁靛鏅涢拑鐔兼煏婢舵鍘涢柛銈呭閺屾盯鎮㈤柨瀣垫濡炪倖鏌ㄧ粔鐟邦嚕椤愶附鍋嬮柛顐ｇ箘閵堬拷
		 public Map<String,String> findBusiPopularizeById()throws Exception
		    {
		    	
		    	StringBuilder sql=new StringBuilder()
		    			.append("select a.aab401,a.aab101,a.aab402,a.aab403,a.aab404")
		    			.append("  from ab04 a")
		    			.append(" where a.aab101=?")
		    			;
		    	return this.queryForMap(sql.toString(), this.get("aab101"));
		    }
		 //闂備礁鎽滈崰搴∥涘Δ鍜佹晩鐎广儱顦粻鎶芥煏婵炲灝鍔ら柣锝忔嫹1(aab402=0)
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
		 //闂備礁鎽滈崰搴∥涘Δ鍜佹晩鐎广儱鎯撴惔锝嗗珰闁圭粯甯╁閬嶆⒑閸忕厧顕滅紒顔艰嫰閻ｇ兘鏁撻敓锟�
		 private boolean busiAddDish()throws Exception
		 {
		    //1.闂佽姘﹂～澶愭儗椤斿墽涓嶉柣鎺濇l闂佽崵濮村ù鍌炲储閼硅埇浜归柨鐕傛嫹
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into ab02(aab101,aab202,aab207,aab203,aab204,")
		    		.append("				  aab205,aab206)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?,?)")
		   			;
		  	//2.闂佽姘﹂～澶愭儗椤斿墽涓嶉柣鏃傚帶閺嬩線鏌熷▓鍨灓闁活叏鎷�
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

		 public List<Map<String,String>> getSysco()throws Exception
		 {
			 StringBuilder sql=new StringBuilder()
					 .append("select scode,sname,sfcode ")
					 .append("from syscode")
					 ;
			 return this.queryForList(sql.toString());
		 }
		 //闂備礁鎽滈崰搴∥涘Δ鍜佹晩鐎广儱顦拑鐔兼煏婢舵鍘涢柛銈呭閺屻倖绺芥径澶岀泿缂備浇顔婄欢姘跺箚閸愵喖绀嬫い鏃囧亹缁夋挳姊洪崨濠庢闁瑰嚖鎷�
		 public List<Map<String,String>> busiDishMenuQuery()throws Exception
		 {
			 StringBuilder sql=new StringBuilder()
					 .append("select a.aab201,a.aab101,a.aab207,a.aab202,a.aab203, ")
					 .append(" 		 a.aab204,a.aab205,a.aab206 ")
					 .append("FROM ab02 a ")
					 .append("where a.aab101 = ? ")
					 ;
			 List<Map<String,String>> tems = this.queryForList(sql.toString(), this.get("aab101"));
			 for (int i = 0; i < tems.size(); i++) 
			 	{
			        tems.get(i).put("qaab204", tems.get(i).get("aab204"));
			        tems.get(i).put("qaab205", tems.get(i).get("aab205"));
			        tems.get(i).put("qaab206", tems.get(i).get("aab206"));
			        parseBusiCodeList(tems.get(i),"aab204");
			        parseBusiCodeList(tems.get(i),"aab205");
			        parseBusiCodeList(tems.get(i),"aab206");
			    }
			    return tems;
		 }
		 
		 private void parseBusiCodeList(Map<String, String> tem, String labelName)throws Exception 
		 {
			 
			 
		    String[] elements = tem.get(labelName).split(",");
		    for(int i = 0; i < elements.length; i++)
		    {
		        elements[i] = convertBusiCodeToName(elements[i], labelName);
		    }
		    tem.put(labelName, Tools.joinArray(elements)) ;
		 }

		 private String convertBusiCodeToName(String code, String labelName) throws Exception
		 {
			 String bLabelName = (labelName.substring(0, 2)) + "a" +(labelName.substring(3, 5)) + String.valueOf(Integer.valueOf(labelName.substring(5,6))-2);
			 String sql = "select sname from syscode where sfcode='"+bLabelName+"' and scode = '"+code+"'";
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
		 
		 private boolean busiDelDishById()throws Exception
		    {
		    	String sql="delete from ab02 where aab201=?";
		    	return this.executeUpdate(sql, this.get("aab201"))>0;
		    }
		 
		 
		 private boolean userAssembleApply()throws Exception
		 {
		    //1.缂傚倸鍊搁崐褰掓偋閺囥垹鐤柟缁樼磿L闂佽崵濮村ù鍌炲储閼硅埇浜归柨鐕傛嫹
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into aa05(aaa101,aab101,aaa502,aaa503,aaa504,")
		    		.append("                 aaa505)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?)")
		   			;
		  	//2.缂傚倸鍊搁崐褰掓偋閺囥垹鐤柟鎹愵嚙閻鏌涚仦鍓р檨婵炲牆鐖奸弻鈩冩媴閻熼偊妫嗙紓渚囧櫙閹凤拷
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
		 //闂備礁缍婇ˉ鎾诲储瑜庨〃銉╁炊椤掞拷閽冪喖鏌曟径妯煎帥闁搞倧鎷�
		 public List<Map<String,String>> userAssemble()throws Exception
		  {
		  		//闂佸搫顦弲婊堟晪闁汇埄鍨奸崑鍛村Φ閸曨垱鍋ㄩ柛娑橈攻閵嗗啴姊洪崫鍕潶闁稿孩鎸抽、姘旈崨顓犻獓闂佺偨鍎卞鍫曨敃閿燂拷
		  		Object aab104=this.get("qaab104");     //闂佸湱鍘ч悺銊┿�冩繝鍥х闁汇垻顭堢憴锕傛煥閻曞倹瀚� 婵犵妲呴崹鐣屾閺囩姵鍏滈柨鏇炲�搁拑鐔兼煏婢舵鍘涢柛銈忔嫹
		  		Object aaa103=this.get("qaaa103");     //闂備礁缍婇ˉ鎾诲储瑜庨〃銉╁炊椤掞拷閻鏌熸潏鍓хɑ鐎规洖鍟块湁婵犲﹥鍔栫�氾拷 婵犵妲呴崹鐣屾閺囩姵鍏滈柨鏇炲�搁拑鐔兼煏婢舵鍘涢柛銈忔嫹
		  		Object aaa504=this.get("qaaa504");     //闂備礁缍婇ˉ鎾诲储瑜庨〃銉╁炊閵娧屾锤闂佺粯鍨惰摫婵炲牞鎷�
		  		Object aaa502=this.get("qaaa502");     //闂備礁缍婇ˉ鎾诲储瑜庨〃銉╁炊瑜滈崵鏇㈡煥閻旇袚闁逛究鍔庨敓鏂ょ秵閸嬪懘藝瑜斿濠氬磼閿旇棄顏�
		  		Object aaa503=this.get("qaaa503");     //闂備礁缍婇ˉ鎾诲储瑜庨〃銉╁炊閳哄啰锛滈梺瑙勫劤閻°劎浜搁崱娑欑厸闁告劑鍔庨崺锝嗕繆椤愵剚瀚�
		  		
		  		//闂佽姘﹂～澶愭儗椤斿墽涓嶉柣鎴犵潔L濠电偞鍨堕幑渚�顢欐繝鍕闁跨噦鎷�
		  		StringBuilder sql=new StringBuilder()
		  				.append("select	a.aab101,a.aab104,a.aab105,b.aaa101,b.aab101,")
		  				.append("		b.aaa502,b.aaa503,b.aaa504,b.aaa505,c.aaa101,")
		  				.append("		c.aaa102,c.aaa103")
		  				.append(" from 	ab01 a,aa05 b,aa01 c")
		  				.append(" where	a.aab101=b.aab101 and c.aaa101=b.aaa101")
		  				;
		  		
		  		//闂備礁鎲￠悷銉╁磹瑜版帒姹查柣鏃傚帶缁�鍡樹繆閵堝懎顏ラ柨鐔告灮閹凤拷
		  		List<Object> paramList=new ArrayList<>();
		  		//闂傚倷绶￠崑鍛村礉閹烘梻鍗氶柟缁㈠枛缁�鍡涙煏閸繃顥為柣鎺嶇矙閺岋紕浠︾拠鎻掑Г濡炪倖娲橀〃濠傤嚕閸洖鐏抽柛娆忣樈閸嬨劑姊洪崫鍕伌闁搞劋鍗抽獮鍡樻媴婵劒姹楅梺鍝勬川閸嬫稑顕ｉ敓锟�,闂備胶鎳撻崲鏌ュ触鐎ｎ剚鏆滅痪鏉垮皰D闂備礁鎼ˇ顐︽晸閽樺绾фい鎰舵嫹
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
		 
		 
		 
		 //闂備礁鎽滈崰搴∥涘Δ鍜佹晩鐎广儱顦伴崵鏇熺節婵犲倸鏆欑紒锟界�ｎ喗鐓涘璺烘４閹风兘宕ｆ径妯轰缓闂備礁鎼悮顐﹀磿閹绢噮鏁嬮柨鐕傛嫹
		 public List<Map<String,String>> busiQuery()throws Exception
		  {
		  		//
			 	Object aab101=this.get("aab101");
		  		Object aab207=this.get("qaab207");     //
		  		Object aab204=Tools.joinArray(this.get("qaab204"));     //
		  		Object aab205=Tools.joinArray(this.get("qaab205"));     //
		  		Object aab206=this.get("qaab206");     //
		  		
		  		//
		  		StringBuilder sql=new StringBuilder()
		  				.append("select a.aab201,a.aab101,a.aab207,a.aab202,a.aab203, ")
		  				.append(" 		a.aab204,a.aab205,a.aab206 ")
						.append("  FROM ab02 a ")
						.append(" where a.aab101=? ") 
		  				;
		  		
		  		//
		  		List<Object> paramList=new ArrayList<>();
		  		//
		  			
		  		paramList.add(aab101);
		  		
		  		if(this.isNotNull(aab207))
		  		{
		  			sql.append(" and a.aab207 like ?");
		  			paramList.add("%"+aab207+"%");
		  		}
		  		if(this.isNotNull(aab204))
		  		{
		  			sql.append(" and a.aab204 like ?");
		  			paramList.add("%"+aab204+"%");
		  		}
		  		if(this.isNotNull(aab205))
		  		{
		  			sql.append(" and a.aab205 like ?");
		  			paramList.add("%"+aab205+"%");
		  		}
		  		if(this.isNotNull(aab206))
		  		{
		  			sql.append(" and a.aab206 = ?");
		  			paramList.add(aab206);
		  		}
		  		
		  		sql.append(" order by a.aab201");
		  		List<Map<String,String>> tems = this.queryForList(sql.toString(), paramList.toArray());
				 for (int i = 0; i < tems.size(); i++) 
				 	{
				        tems.get(i).put("qaab204", tems.get(i).get("aab204"));
				        tems.get(i).put("qaab205", tems.get(i).get("aab205"));
				        tems.get(i).put("qaab206", tems.get(i).get("aab206"));
				        //闁兼儳鍢茶ぐ鍥ㄧ▔閿熶粙寮堕垾鍐茬稉闁告稑鍟块懟鐔煎箮婵犱礁鏁╅柣顔荤劍濞存盯骞戦～顓＄濞戞搩鍘介弸锟�
				        parseBusiCodeList(tems.get(i),"aab204");
				        parseBusiCodeList(tems.get(i),"aab205");
				        parseBusiCodeList(tems.get(i),"aab206");
				    }
				    return tems;
		  }
		 //闁哥喎妫楅宥夊蓟閵壯勭畽閻犱降鍨规鍥ㄧ┍閳╁啩绱�(闁哄牜浜滈ˇ鈺呮偠閿燂拷)
		 public List<Map<String,String>> busiManageReservation()throws Exception
		    {
		    	StringBuilder sql=new StringBuilder()
		    			 .append("SELECT a.aac101,a.aaa101,a.aab101,a.aaa201,a.aac102,")
		    			 .append("		 a.aac103,a.aac104,a.aac105,a.aac106,b.aaa101,")
		    			 .append("		 b.aaa103")
		    			 .append("	FROM ac01 a,aa01 b")
		    			 .append(" WHERE a.aaa101 = b.aaa101  ")
		    			 .append("	AND  a.aab101 = ? ")
		    			 .append(" 	AND  a.aac106 = ? ")
		    			 ;
		    	Object args[]=
			    	{
			   			this.get("aab101"),
			   			"0"
			    	};
		    	return this.queryForList(sql.toString(), args);
		    }
		 //闁哥喎妫楅宥夊蓟閵壯勭畽閻犱降鍨规鍥ㄧ┍閳╁啩绱�
		 public List<Map<String,String>> busiReservation()throws Exception
		    {
		    	StringBuilder sql=new StringBuilder()
		    			 .append("SELECT a.aac101,a.aaa101,a.aab101,a.aaa201,a.aac102,")
		    			 .append("		 a.aac103,a.aac104,a.aac105,a.aac106,b.aaa101,")
		    			 .append("		 b.aaa103")
		    			 .append("	FROM ac01 a,aa01 b")
		    			 .append(" WHERE a.aaa101 = b.aaa101  ")
		    			 .append("	AND  a.aab101 = ? ")
		    			 .append(" 	AND  a.aac106 = ? ")
		    			 ;
		    	Object args[]=
			    	{
			   			this.get("aab101"),
			   			"1"
			    	};
		    	return this.queryForList(sql.toString(), args);
		    }
		 //闁哥喎妫楅宥夋焻濮樺磭绠栭悹浣靛灩妤犲洦绌遍埄鍐х礀
		 private boolean busiAccessReservation()throws Exception
		 {
			
			 StringBuilder sql=new StringBuilder()
		    			.append("UPDATE ac01 SET aac106 = ?")
		    			.append(" WHERE aac101 = ?")
		    			;
		    	Object args[]=
		    		{
		    			"1",
		    			this.get("aac101")
		    		};
			return this.executeUpdate(sql.toString(), args)>0;
		 }
		//闁哥喎妫楅宥夊箯閹烘梻鍗滈悹浣靛灩妤犲洦绌遍埄鍐х礀
		 private boolean busiRefuseReservation()throws Exception
		 {
			
			 StringBuilder sql=new StringBuilder()
		    			.append("UPDATE ac01 SET aac106 = ?")
		    			.append(" WHERE aac101 = ?")
		    			;
		    	Object args[]=
		    		{
		    			"2",
		    			this.get("aac101")
		    		};
		    	
			return this.executeUpdate(sql.toString(), args)>0;
		 }
		 //鍗曚緥鏌ヨ鑿滃崟	
		 public Map<String,String> busiFindDishById()throws Exception
		    {
		    	
				StringBuilder sql=new StringBuilder()
		    			.append("SELECT a.aab201,a.aab101,a.aab207,a.aab202,a.aab203,")
		    			.append("			 a.aab204,a.aab205,a.aab206")
		    			.append("	FROM ab02 a")
		    			.append(" WHERE a.aab201 = ?")
		    			;
		    	return this.queryForMap(sql.toString(), this.get("aab201"));
		    }
		 private boolean busiModfyDish()throws Exception
		 {
			
//			 StringBuilder sql=new StringBuilder()
//		    			.append("UPDATE ab02 SET aab207=?,aab202=?,aab203=?,aab204=?,aab205=?,")
//		    			.append("			aab206=?")
//		    			.append("	  WHERE aab201=?")
//		    			;
//		    	Object args[]=
//		    		{
//		    			this.get("aab207"),
//		    			this.get("aab202"),
//		    			this.get("aab203"),
//		    			Tools.joinArray(this.get("aab204")),
//		    			Tools.joinArray(this.get("aab205")),
//		    			this.get("aab206"),
//		    			this.get("aab201")
//		    		};
				  		
		  		Object aab207=this.get("aab207");  
		  		Object aab202=this.get("aab202");  
		  		Object aab203=this.get("aab203");  
		  		Object aab204=Tools.joinArray(this.get("aab204"));     
		  		Object aab205=Tools.joinArray(this.get("aab205"));     
		  		Object aab206=this.get("aab206");     
		  		
		  		//
		  		StringBuilder sql=new StringBuilder()
		  				.append("UPDATE ab02 SET aab207=?,aab202=?,aab203=?")
		    			; 
		  		
		  		//
		  		List<Object> paramList=new ArrayList<>();
		  		//
		  			
		  		paramList.add(aab207);
		  		paramList.add(aab202);
		  		paramList.add(aab203);
		  		
		  		if(this.isNotNull(aab204))
		  		{
		  			sql.append(" ,aab204=?");
		  			paramList.add(aab204);
		  		}
		  		if(this.isNotNull(aab205))
		  		{
		  			sql.append(" ,aab205=?");
		  			paramList.add(aab205);
		  		}
		  		if(this.isNotNull(aab206))
		  		{
		  			sql.append(" ,aab206=?");
		  			paramList.add(aab206);
		  		}
		  		sql.append("	  WHERE aab201=?");
		  		paramList.add(this.get("aab201"));
			return this.executeUpdate(sql.toString(), paramList.toArray())>0;
		 }
		 //鍟嗗鎵归噺鍒犻櫎鑿滃崟
		 private boolean busiBatchDelDish()throws Exception
		    {
		    	//1.闂佽姘﹂～澶愭儗椤斿墽涓嶉柣鎴犵潔L闂佽崵濮村ù鍌炲储閼硅埇浜归柨鐕傛嫹
		    	String sql="delete from ab02 where aab201=?";
		    	//2.闂備礁鍚嬮崕鎶藉床閼艰翰浜归柛銉ｅ妸娴滄粓鏌ｉ姀鐘冲暈婵℃せ鏆恉list闂備浇妗ㄩ悞锔界珶閸℃瑥鍨濋柨鐕傛嫹
		    	String idlist[]=this.getIdList("idlist");
		    	//3.闂備礁婀遍悷鎶藉幢閳哄倹鏉�
		    	return this.batchUpdate(sql, idlist);
		    }
		 //鎺ㄥ箍鏌ヨ
		 public Map<String,String> busiFindPopularizeById()throws Exception
		    {
		    	
				StringBuilder sql=new StringBuilder()
						.append("SELECT a.aab401,a.aab101,a.aab402,a.aab403,a.aab404")
						.append("	FROM ab04 a")
						.append("WHERE a.aab101=?")
		    			;
		    	return this.queryForMap(sql.toString(), this.get("aab101"));
		    }
		//閲嶅悕
		 public Map<String, String> busiCheckName(String aab102)throws Exception
		    {
		    	
				StringBuilder sql=new StringBuilder()
						.append("SELECT aab102 FROM ab01 WHERE aab102 = ?")
		    			;
		    	return this.queryForMap(sql.toString(), aab102);
		    }
		 //鍟嗗涓婁紶淇敼鍟嗗璧勮川淇℃伅
		 private boolean busiAddCertificate()throws Exception
		 {
			 Object aab108 ="upload/" + this.get("imgPath");
			 StringBuilder sql=new StringBuilder()
		    			.append("UPDATE ab01 ")
		    			.append(" 	SET aab105=?,aab108 = ? ")
		    			.append(" WHERE aab101 = ?")
		    			;
		    	Object args[]=
		    		{
		    			"0",
		    			aab108,
		    			this.get("aab101")
		    		};
		    	
			return this.executeUpdate(sql.toString(), args)>0;
		 }
		 //鏌ヨ鍥剧墖淇℃伅
		 public Map<String,String> busiToCertificatePage()throws Exception
		    {
		    	
				StringBuilder sql=new StringBuilder()
						.append("  SELECT a.aab108")
						.append("	 FROM ab01 a")
						.append("	WHERE a.aab101=?")
		    			;
		    	return this.queryForMap(sql.toString(), this.get("aab101"));
		    }
		 
			//鍒嗗壊鍟嗗鑿滃搧鍥剧墖鐨勫湴鍧�(upload/xxx.jpg,upload/xxx.jpg,.......)
			public List<Map<String,String>> saveBusiDishPicAddress()throws Exception
			{
				String sql="SELECT aab202 FROM ab02 WHERE aab201 = ? ";
				String str=this.queryForMap(sql, this.get("busiId")).get("aab202");
				String strs[]=str.split(",");
				List<Map<String,String>> AddressList=new ArrayList();
				for (int i = 0; i <strs.length; i++)
				{
					Map<String,String> map= new HashMap();
					strs[i]="images/"+strs[i];
					map.put("address",strs[i]);
					AddressList.add(map);
				}
				return AddressList;
			}
			
			
			
			/*
			 * MessageText---消息内容
			 * Id---接受方流水号
			 */
			//发送消息给用户
			public boolean addMessageToCust(String MessageText,String CustId)throws Exception
			{
				String DateTime= Tools.getDateTime();
				String sql="insert into ac03 (aaa101,aac302,aac303,aac304) values (?,?,?,?)";
				Object args[]={CustId,MessageText,DateTime,"1"};
				return this.executeUpdate(sql, args)>0;
			}					
			//发送消息给商家
			public boolean addMessageToBuss(String MessageText,String BussId)throws Exception
			{
				String DateTime= Tools.getDateTime();
				String sql="insert into ac03 (aab101,aac302,aac303,aac304) values (?,?,?,?)";
				Object args[]={BussId,MessageText,DateTime,"1"};
				return this.executeUpdate(sql, args)>0;
			}
		 
}
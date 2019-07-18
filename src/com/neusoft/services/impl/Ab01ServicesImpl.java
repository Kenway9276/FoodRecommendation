package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
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
    
    private boolean userRegister()throws Exception
    {
    	//1.缂傚倸鍊归悧鏇㈠疮閹绘紕L闁荤姴娴傞崢鑹般亹閿燂拷
    	StringBuilder sql=new StringBuilder()
    			.append("insert into aa01(aaa102,aaa103,aaa104,aaa105,aaa106,")
    			.append("                 aaa107,aaa108,aaa110)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,CURRENT_DATE)")
    			;
    	//2.缂傚倸鍊归悧鏇㈠疮閹捐鐭楅柛灞剧♁濞堝爼鏌℃担鐟邦棆缂侇噯鎷�
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
    	//1.缂傚倹鐗曢崯鎻漄L閻犲浂鍘艰ぐ锟�
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac02(aac202,aac203,aac204,aac205,aac206,")
    			.append("                 aac207,aac401)")
    			.append("          values(?,CURRENT_TIMESTAMP,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.缂傚倸鍊归悧鏇㈠疮閹捐鐭楅柛灞剧♁濞堝爼鏌℃担鐟邦棆缂侇噯鎷�
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
    	//闂佸吋鍎抽崲鑼躲亹閸ヮ亗浜归柟鎯у暱椤ゅ懘鏌涘☉娅亝瀵奸幇顔剧＝闁哄诞鍐ㄢ枏
    	String aab103=Tools.getEmpNumber();
    	//闂佸憡纰嶉崢鐚匫濠电儑缍�椤曆勬叏閻愬搫宸濇俊顖濇〃缁憋絿绱撻崒娑氬ⅹ鐟滃府鎷�
    	this.put("aab103", aab103);
    	
    	//1.缂傚倸鍊归悧鏇㈠疮閹绘紕L闁荤姴娴傞崢鑹般亹閿燂拷
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
    			.append("                 aab107,aab108,aab109,aab110,aab111,")
    			.append("                 aab112,aab113)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.缂傚倸鍊归悧鏇㈠疮閹捐鐭楅柛灞剧♁濞堝爼鏌℃担鐟邦棆缂侇噯鎷�
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
    	//1.闁诲氦顫夐惌顔剧不閻戠睍L闁荤姴娴傞崢鑹般亹閿燂拷
    	String sql="delete from ab01 where aab101=?";
    	//2.闂佸吋鍎抽崲鑼躲亹閸ャ劊浜滈柣銏犳啞濡椻暐dlist闂佽桨鐒︽竟鍡欏垝閿燂拷
    	String idlist[]=this.getIdList("idlist");
    	//3.闂佸湱鐟抽崱鈺傛杸
    	return this.batchUpdate(sql, idlist);
    }
    
    private boolean userHistoryDelete()throws Exception
    {
    	//1.闁诲氦顫夐惌顔剧不閻戠睍L闁荤姴娴傞崢鑹般亹閿燂拷
    	String sql="delete from ac01 where aac101=?";
    	//2.闂佸吋鍎抽崲鑼躲亹閸ャ劊浜滈柣銏犳啞濡椻暐dlist闂佽桨鐒︽竟鍡欏垝閿燂拷
    	String idlist[]=this.getIdList("idlist");
    	//3.闂佸湱鐟抽崱鈺傛杸
    	return this.batchUpdate(sql, idlist);
    }
    

    
    private boolean adminNoticeDelete()throws Exception
    {
    	//1.闁诲氦顫夐惌顔剧不閻戠睍L闁荤姴娴傞崢鑹般亹閿燂拷
    	String sql="delete from ac02 where aac201=?";
    	//2.闂佸吋鍎抽崲鑼躲亹閸ャ劊浜滈柣銏犳啞濡椻暐dlist闂佽桨鐒︽竟鍡欏垝閿燂拷
    	String idlist[]=this.getIdList("idlist");
    	//3.闂佸湱鐟抽崱鈺傛杸
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
    			Tools.getMd5(this.get("aac404")),
    	};
    	return this.queryForMap(sql.toString(), args);
    }
    
    public Map<String,String> findById()throws Exception
    {
    	//1.缂傚倸鍊归悧鏇㈠疮閹绘紕L闁荤姴娴傞崢鑹般亹閿燂拷
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
    			.append("       a.aab107,a.aab108,a.aab109,a.aab110,a.aab111,")
    			.append("       a.aab112,a.aab113")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?")
    			;
    	//闂佸湱鐟抽崱鈺傛杸闂佸搫琚崕鎾敋閿燂拷
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
    public Map<String,String> findByIdNotice()throws Exception
    {
    	//1.缂傚倸鍊归悧鏇㈠疮閹绘紕L闁荤姴娴傞崢鑹般亹閿燂拷
    	StringBuilder sql=new StringBuilder()
    			.append("select aac202,aac203,aac204,aac205,")
    			.append("       aac206,aac207")
    			.append("  from ac02")
    			.append(" where aac201=?")
    			;
    	//闂佸湱鐟抽崱鈺傛杸闂佸搫琚崕鎾敋閿燂拷
    	return this.queryForMap(sql.toString(), this.get("aac201"));
    }
    
    
      /**
       * 婵炴垶鎸哥粔鎾偩妤ｅ啫绾ч柍銉ュ级椤愪粙鏌＄仦璇插姤妞ゆ洩鎷�
       * @return
       * @throws Exception
       */
	  public List<Map<String,String>> query()throws Exception
	  {
	  		//闁哄鏅滈敋閻㈩垼鍋呴妵鍕偨閸涘﹥銆冮梺鍝勮閸庢挳顢氬Δ鍛骇闁炽儱寮堕锟�
	  		Object aab102=this.get("qaab102");     //婵犳鍠楅幐鎼佸箖閿燂拷  濠碘槅鍨界槐鏇犳兜閿曞倸钃熼柕澶樼厛閸わ拷
	  		Object aab103=this.get("qaab103");     //缂傚倸鍊归悧鏇°亹閿燂拷
	  		Object aab105=this.get("qaab105");     //闂佽鍎搁崘銊у姸
	  		Object aab106=this.get("qaab106");     //濠殿喗蓱閸ㄨ泛螞閿燂拷
	  		Object baab104=this.get("baab104");    //闂佹眹鍨婚崰鎰涢妴锟�
	  		Object eaab104=this.get("eaab104");    //闂佹眹鍨婚崰鎰涢妴锟�
	  		
	  		//闁诲氦顫夐惌顔剧不閻戠睍L婵炴垶鎹侀濠勭礊閿燂拷
	  		StringBuilder sql=new StringBuilder()
	  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
	  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
	  				.append("  from syscode a,syscode b, ab01 x")
	  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
	  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
	  				;
	  		
	  		//闂佸憡鐟ラ崐褰掑汲閻旂厧绀嗘俊銈呭閿熸枻鎷�
	  		List<Object> paramList=new ArrayList<>();
	  		//闂備緡鍋呴崝鎺旂博閹绢喖绀嗛柕鍫濇閻掍粙鏌＄仦璇插姤妞ゆ洘顨婂鍫曞灳閸欏鍋ㄩ梺鍝勫閸ㄤ即骞嗘担濮愪汗闁哄洨鍋涘锟�,闂佺懓鍢查崥瀣暜绾板尒D闂佸搫顦敓钘夊级椤愶拷
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
	  		//闁哄鏅滈敋閻㈩垼鍋呴妵鍕偨閸涘﹥銆冮梺鍝勮閸庢挳顢氬Δ鍛骇闁炽儱寮堕锟�
	  		Object aab104=this.get("qaab104");		//闂佸摜鍠庡Λ妤咁敊瀹ュ瑙﹂柨鐕傛嫹
	  		Object aac102=this.get("qaac102");     	//闁荤姳闄嶉崹瑙勵殽閸ヮ剙绫嶉柕澶涢檮閸╋拷
	  		Object aac103=this.get("qaac103");     	//闂佺儵鍋撻崝鎴λ囬悽绋跨睄闁靛闄勯崺锟�
	  		Object aac104=this.get("qaac104");     	//婵炲瓨绮庨崕銈夊汲閿燂拷
	  		Object aac105=this.get("qaac105");     	//闁荤姳闄嶉崹瑙勵殽閸ヮ剙鐭楅柨鐕傛嫹
	  		Object aaa202=this.get("qaaa202");     	//闂佸憡鐟辩徊浠嬪箠閿燂拷
	  		Object aaa203=this.get("qaaa203");     	//闂佸吋瀵х划搴ㄦ焾閿燂拷
	  		Object aaa204=this.get("qaaa204");     	//缂備礁顦粔鍓佹偖閿燂拷
	  		Object aaa205=this.get("qaaa205");     	//闁荤姳鐒﹂崕鎶剿囬敓锟�
	  		Object aaa206=this.get("qaaa206");     	//婵炶揪绲界粔鍫曟偪閿燂拷
	  		
	  		//闁诲氦顫夐惌顔剧不閻戠睍L婵炴垶鎹侀濠勭礊閿燂拷
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
	  		
	  		//闂佸憡鐟ラ崐褰掑汲閻旂厧绀嗘俊銈呭閿熸枻鎷�
	  		List<Object> paramList=new ArrayList<>();
	  		//闂備緡鍋呴崝鎺旂博閹绢喖绀嗛柕鍫濇閻掍粙鏌＄仦璇插姤妞ゆ洘顨婂鍫曞灳閸欏鍋ㄩ梺鍝勫閸ㄤ即骞嗘担濮愪汗闁哄洨鍋涘锟�,闂佺懓鍢查崥瀣暜绾板尒D闂佸搫顦敓钘夊级椤愶拷
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
	  		List<Map<String, String>> tems = this.queryForList(sql.toString(), paramList.toArray());
	  		
	        for (int i = 0; i < tems.size(); i++) {
	            tems.get(i).put("qaaa204", tems.get(i).get("aaa204"));
	            tems.get(i).put("qaaa202", tems.get(i).get("aaa202"));
	            tems.get(i).put("qaaa203", tems.get(i).get("aaa203"));
	            //閼惧嘲褰囨稉锟介弶鈥充焊婵傝棄鑻熼幎濠佸敩閻焦娴涢幑顫礋娑擃厽鏋�
	            parseCodeList(tems.get(i),"aaa204");
	            parseCodeList(tems.get(i),"aaa202");
	            parseCodeList(tems.get(i),"aaa203");
	        }
	  		
	  		return tems;
	  }
	    
	    private void parseCodeList(Map<String, String> tem, String labelName)throws Exception {
	        String[] elements = tem.get(labelName).split(",");
	        for(int i = 0; i < elements.length; i++){
	            elements[i] = convertCodeToName(elements[i], labelName);
	        }
	        tem.put(labelName, Tools.joinArray(elements)) ;
	    }

	    /**
	     * 閼惧嘲褰噑yscode娑擃厺鍞惍浣割嚠鎼存梻娈戞稉顓熸瀮
	     * 濮ｆ柨顩aa203娑擄拷1鐎电懓绨茬粔浣瑰煣閼匡拷
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
	  		//闁哄鏅滈敋閻㈩垼鍋呴妵鍕偨閸涘﹥銆冮梺鍝勮閸庢挳顢氬Δ鍛骇闁炽儱寮堕锟�
	  		Object aac203=this.get("qaac203");		//闂佸憡鐟﹂崹鐢电博閻戣棄绫嶉柕澶涢檮閸╋拷
	  		Object aac402=this.get("qaac402");     	//闂佸憡鐟﹂崹鐢电博闁垮顩查柛婵嗗缁憋綁鏌涘▎娆愬
	  		Object aac202=this.get("qaac202");     	//闂佸搫绉村ú顓€�傞敓锟�
	  		Object aac206=this.get("qaac206");     	//缂備礁顦粔鍓佹偖閿燂拷
	  		Object aac207=this.get("qaac206");     	//婵炴潙鍚嬮敋闁告ɑ绋撻惀顏堟晸閿燂拷
	  		
	  		//闁诲氦顫夐惌顔剧不閻戠睍L婵炴垶鎹侀濠勭礊閿燂拷
//	  		select aaa102,aaa103,aab104,aac102,aac103,aac104,aac105,aaa202,aaa203,aaa204,aaa205,aaa206
//	  		from aa01 a,ab01 b,ac01 c,aa02 d
//	  		where a.aaa101=c.aaa101 and b.aab101=c.aab101 and c.aaa201=d.aaa201 and a.aaa101=d.aaa101
	  		StringBuilder sql=new StringBuilder()
	  				.append("select aac201,aac203,aac202,aac206,aac207")
	  				.append("  from ac02 a,ac04 b")
	  				.append(" where a.aac401=b.aac401")
	  				;
	  		
	  		//闂佸憡鐟ラ崐褰掑汲閻旂厧绀嗘俊銈呭閿熸枻鎷�
	  		List<Object> paramList=new ArrayList<>();
	  		//闂備緡鍋呴崝鎺旂博閹绢喖绀嗛柕鍫濇閻掍粙鏌＄仦璇插姤妞ゆ洘顨婂鍫曞灳閸欏鍋ㄩ梺鍝勫閸ㄤ即骞嗘担濮愪汗闁哄洨鍋涘锟�,闂佺懓鍢查崥瀣暜绾板尒D闂佸搫顦敓钘夊级椤愶拷
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
	     * 闂佽法鍠愰弳锟界痪顓㈡敱鐎氬綊鏌ㄩ悢铏瑰彄濞村吋鐟︾�氬綊鏌ㄩ悢鍛婄伄闁瑰嘲鍢茬紞锟�
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
		 //闂佽法鍠愰弳锟界痪顓㈡敱鐎氱懓鈻旈妸鈺傛櫢闁哄倶鍊栫�氾拷
		 private boolean busiRegister()throws Exception
		 {
		    //1.闂佽法鍠愰弸濠氬箯瀹勬澘鏅窼QL闂佽法鍠愰弸濠氬箯閻戣姤鏅搁柨鐕傛嫹
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
		    		.append("                 aab107,aab108,aab109,aab110,aab111,")
		   			.append("                 aab112,aab113,aab114)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?,?,?,?,?,")
		   			.append("                 ?,?,?)")
		   			;
		  	//2.闂佽法鍠愰弸濠氬箯瀹勬澘鏅搁梺璺ㄥ枑閺嬪骞忛悜鑺ユ櫢闁哄倶鍊栫�氬綊鏌ㄩ悢鍛婄伄闁归鍏橀弫鎾诲棘閵堝棗顏�
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
		 //闂佽法鍠愰弳锟界痪顓㈡敱鐎氱懓鈻旈妸鈺傛櫢闁哄倶鍊栫�氬綊鏌ㄩ悢鐑樼暦閻犱浇顫夌�氬綊鏌ㄩ悢鑽ょ獩閺夊牏鍋撶�氬綊鏌ㄩ悢鍛婄伄闁圭兘鏀辨导鍛存煥閻斿憡鐏柟椋庮煣a06(闂佽法鍠愰弸濠氬箯閻戣姤鏅搁柡鍌樺�栫�氬綊鏌ㄩ悢鍛婄伄闁瑰嚖鎷�)
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
		 //闂佽法鍠愰弳锟界痪顓㈡敱鐎氱懓鈻旈妸鈺傛櫢闁哄倶鍊栫�氬綊鏌ㄩ悢鐑樼暦閻犱浇顫夌�氬綊鏌ㄩ悢鑽ょ獩閺夊牏鍋撶�氬綊鏌ㄩ悢鍛婄伄闁归顭04(闂佽法鍠愰弸濠氬箯閻戣姤鏅搁柡鍌樺�栫�氬綊鏌ㄩ悢鍛婄伄闁瑰嚖鎷�)
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
		 //闂佸摜鍠庡Λ妤咁敊瀹ュ棛鈹嶆い鏃囧Г閺嗩厼菐閸ワ絽澧插ù纭锋嫹
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
		//闂佸憡顨嗗ú鎴犳閵夆晛钃熼柕澶樼厛閸ゅ嫰鏌涢悢閿嬵棞妞ゆ柨绉瑰顐︽偋閸繄銈�
		 public Map<String,String> findBusiPopularizeById()throws Exception
		    {
		    	
		    	StringBuilder sql=new StringBuilder()
		    			.append("select a.aab401,a.aab101,a.aab402,a.aab403,a.aab404")
		    			.append("  from ab04 a")
		    			.append(" where a.aab101=?")
		    			;
		    	return this.queryForMap(sql.toString(), this.get("aab101"));
		    }
		 //闂佸摜鍠庡Λ妤咁敊瀹ュ绠抽柕濞垮劤閻ｏ拷1(aab402=0)
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
		 //(aab402=1)
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
		 //闂佸摜鍠庡Λ妤咁敊瀹ュ惓搴ｆ嫚閹绘帩娼遍梺鍏煎缁苯鐣烽敓锟�
		 private boolean busiAddDish()throws Exception
		 {
		    //1.闁诲氦顫夐惌顔剧不閻掝櫡l闁荤姴娴傞崢鑹般亹閿燂拷
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into ab02(aab101,aab202,aab207,aab203,aab204,")
		    		.append("				  aab205,aab206)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?,?)")
		   			;
		  	//2.闁诲氦顫夐惌顔剧不閻旂厧鏋侀柟娈垮枤閻拷
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
		 //闂備緡鍓欑粔鏉戭啅缁畨sycode
		 public List<Map<String,String>> getSysco()throws Exception
		 {
			 StringBuilder sql=new StringBuilder()
					 .append("select scode,sname,sfcode ")
					 .append("from syscode")
					 ;
			 return this.queryForList(sql.toString());
		 }
		 //闂佸摜鍠庡Λ妤咁敊瀹ュ钃熼柕澶樼厛閸ゅ嫰鏌ゆ總澶夌盎缂佽绶氶幆鍐礋椤旇偐绉撮梺鍛婎殣閹凤拷
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
			        //闂佸吋鍎抽崲鑼躲亹閸ャ劎鈻旈柨鐔剁矙瀵爼鍨鹃崘鑼▔闂佸憡绋戦崯鍧楁嚐閻旂厧绠┑鐘辩閺佲晠鏌ｉ鑽ゅ妽婵炲瓨鐩獮鎴︼綖椤擄紕顦版繛鎴炴惄閸樹粙寮搁敓锟�
			        parseBusiCodeList(tems.get(i),"aab204");
			        parseBusiCodeList(tems.get(i),"aab205");
			        parseBusiCodeList(tems.get(i),"aab206");
			    }
			    return tems;
		 }

		 //闁诲繐绻愬Λ娆撳汲閻旇櫣纾奸柛鏇ㄤ海閸橆剟鏌ｉ妸銉ヮ伀缂侀硸浜幆宥嗘媴閼恒儳銈梺纭咁嚃濠拷閻犳劗鍠栧畷銉ヮ吋閸ュ棴鎷�
		 private void parseBusiCodeList(Map<String, String> tem, String labelName)throws Exception 
		 {
			 
			 
		    String[] elements = tem.get(labelName).split(",");
		    for(int i = 0; i < elements.length; i++)
		    {
		        elements[i] = convertBusiCodeToName(elements[i], labelName);
		    }
		    tem.put(labelName, Tools.joinArray(elements)) ;
		 }
		 //闁诲繐绻愬Λ妤呭疾閵忣澁鎷风憴鍕姸鐟滄澘绉瑰畷顐ｆ媴閻ゎ垰骞�闂佹眹鍔岀�氼剝銇愬☉銏犲窛闁跨噦鎷�,闂佸吋瀵х划搴ㄦ焾閹绢喗鍋ㄩ弶鍫氭櫇濡炰粙鏌涘▎鎴炵効婵炴潙妫濆畷鐘诲冀閿曚胶顦伴梺鍛婅壘缁夋儼鈪�
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
		 
		 //闂佸搫绉烽～澶婄暤娑旑槆b201闂佸憡顨嗗ú鎴犳閵夆晛绀嗛柣妯肩帛閻濈喖鏌ら幐搴ｇ煀鐎规洩鎷�
		 private boolean busiDelDishById()throws Exception
		    {
		    	String sql="delete from ab02 where aab201=?";
		    	return this.executeUpdate(sql, this.get("aab201"))>0;
		    }
		 
		 
		 private boolean userAssembleApply()throws Exception
		 {
		    //1.缂傚倸鍊归悧鏇㈠疮閹绘紕L闁荤姴娴傞崢鑹般亹閿燂拷
			 	StringBuilder sql=new StringBuilder()
		    		.append("insert into aa05(aaa101,aab101,aaa502,aaa503,aaa504,")
		    		.append("                 aaa505)")
		   			.append("          values(?,?,?,?,?,")
		   			.append("                 ?)")
		   			;
		  	//2.缂傚倸鍊归悧鏇㈠疮閹捐鐭楅柛灞剧♁濞堝爼鏌℃担鐟邦棆缂侇噯鎷�
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
		 //闂佸綊顥撻崢褎顨ラ崶顒�钃熼柕澶樼厛閸わ拷
		 public List<Map<String,String>> userAssemble()throws Exception
		  {
		  		//闁哄鏅滈敋閻㈩垼鍋呴妵鍕偨閸涘﹥銆冮梺鍝勮閸庢挳顢氬Δ鍛骇闁炽儱寮堕锟�
		  		Object aab104=this.get("qaab104");     //闁圭厧鐡ㄩ〃濠囧箺閻㈢瑙﹂柨鐕傛嫹 濠碘槅鍨界槐鏇犳兜閿曞倸钃熼柕澶樼厛閸わ拷
		  		Object aaa103=this.get("qaaa103");     //闂佸綊顥撻崢褎顨ラ崶顒�鐭楅柟杈剧稻瀹曞啿霉濠婃劖瀚� 濠碘槅鍨界槐鏇犳兜閿曞倸钃熼柕澶樼厛閸わ拷
		  		Object aaa504=this.get("qaaa504");     //闂佸綊顥撻崢褎顨ラ崶銊ь洸闁绘垶蓱濞堬拷
		  		Object aaa502=this.get("qaaa502");     //闂佸綊顥撻崢褎顨ラ崶褜鍤曢柨鐔诲Г閹便劎锟斤綆鍋呴ˇ褔姊婚崒锔藉
		  		Object aaa503=this.get("qaaa503");     //闂佸綊顥撻崢褎顨ラ崶鈺冪＜闁规儳鐡ㄧ亸鍡涙煛閸愩劎鍩ｆ俊顐嫹
		  		
		  		//闁诲氦顫夐惌顔剧不閻戠睍L婵炴垶鎹侀濠勭礊閿燂拷
		  		StringBuilder sql=new StringBuilder()
		  				.append("select	a.aab101,a.aab104,a.aab105,b.aaa101,b.aab101,")
		  				.append("		b.aaa502,b.aaa503,b.aaa504,b.aaa505,c.aaa101,")
		  				.append("		c.aaa102,c.aaa103")
		  				.append(" from 	ab01 a,aa05 b,aa01 c")
		  				.append(" where	a.aab101=b.aab101 and c.aaa101=b.aaa101")
		  				;
		  		
		  		//闂佸憡鐟ラ崐褰掑汲閻旂厧绀嗘俊銈呭閿熸枻鎷�
		  		List<Object> paramList=new ArrayList<>();
		  		//闂備緡鍋呴崝鎺旂博閹绢喖绀嗛柕鍫濇閻掍粙鏌＄仦璇插姤妞ゆ洘顨婂鍫曞灳閸欏鍋ㄩ梺鍝勫閸ㄤ即骞嗘担濮愪汗闁哄洨鍋涘锟�,闂佺懓鍢查崥瀣暜绾板尒D闂佸搫顦敓钘夊级椤愶拷
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
		 
		 
		 
		 //闂佸摜鍠庡Λ妤咁敊瀹ュ鍤曟繝濠傚暙缁�瀣煛婢跺棴鎷烽崣澶樺仺闂佸搫琚崕鎾敋閿燂拷
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
				        //閼惧嘲褰囨稉锟介弶鈥冲經閸涘啿鑻熼幎濠佸敩閻焦娴涢幑顫礋娑擃厽鏋�
				        parseBusiCodeList(tems.get(i),"aab204");
				        parseBusiCodeList(tems.get(i),"aab205");
				        parseBusiCodeList(tems.get(i),"aab206");
				    }
				    return tems;
		  }
		 //閸熷棗顔嶉弻銉ф箙鐠併垹楠囨穱鈩冧紖(閺堫亜顦╅悶锟�)
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
		 //閸熷棗顔嶉弻銉ф箙鐠併垹楠囨穱鈩冧紖
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
		 //閸熷棗顔嶉柅姘崇箖鐠併垹楠囨穱鈩冧紖
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
		//閸熷棗顔嶉幏鎺旂卜鐠併垹楠囨穱鈩冧紖
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
		 //单例查询菜单	
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
		 //商家批量删除菜单
		 private boolean busiBatchDelDish()throws Exception
		    {
		    	//1.闁诲氦顫夐惌顔剧不閻戠睍L闁荤姴娴傞崢鑹般亹閿燂拷
		    	String sql="delete from ab02 where aab201=?";
		    	//2.闂佸吋鍎抽崲鑼躲亹閸ャ劊浜滈柣銏犳啞濡椻暐dlist闂佽桨鐒︽竟鍡欏垝閿燂拷
		    	String idlist[]=this.getIdList("idlist");
		    	//3.闂佸湱鐟抽崱鈺傛杸
		    	return this.batchUpdate(sql, idlist);
		    }
		 //推广查询
		 public Map<String,String> busiFindPopularizeById()throws Exception
		    {
		    	
				StringBuilder sql=new StringBuilder()
						.append("SELECT a.aab401,a.aab101,a.aab402,a.aab403,a.aab404")
						.append("	FROM ab04 a")
						.append("WHERE a.aab101=?")
		    			;
		    	return this.queryForMap(sql.toString(), this.get("aab101"));
		    }
		//重名
		 public Map<String, String> busiCheckName(String aab102)throws Exception
		    {
		    	
				StringBuilder sql=new StringBuilder()
						.append("SELECT aab102 FROM ab01 WHERE aab102 = ?")
		    			;
		    	return this.queryForMap(sql.toString(), aab102);
		    }
		 //商家上传修改商家资质信息
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
		 //查询图片信息
		 public Map<String,String> busiToCertificatePage()throws Exception
		    {
		    	
				StringBuilder sql=new StringBuilder()
						.append("  SELECT a.aab108")
						.append("	 FROM ab01 a")
						.append("	WHERE a.aab101=?")
		    			;
		    	return this.queryForMap(sql.toString(), this.get("aab101"));
		    }
		 
			//分割商家菜品图片的地址(upload/xxx.jpg,upload/xxx.jpg,.......)
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
		 
}
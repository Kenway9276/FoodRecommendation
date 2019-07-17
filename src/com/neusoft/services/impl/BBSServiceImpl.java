package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.BBSTools;
import com.neusoft.system.tools.Base64Utils;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BBSServiceImpl extends JdbcServicesSupport {
    @Override
    public Map<String, String> findById() throws Exception {
        return null;
    }

    @Override
    public List<Map<String, String>> query() throws Exception {
        Object aaa101  = this.get("userID");
        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	aaa301, ")
                .append("	aaa303, ")
                .append("	aaa304, ")
                .append("	aaa302, ")
                .append("	aaa306, ")
                .append("	aaa103 ")
                .append("FROM ")
                .append("	aa03,aa01 ")
                .append("WHERE ")
                .append("	(aaa301 != 1  ")
                .append("	AND aaa305 = 0) ")
                .append("	and aa01.aaa101 = aa03.aaa101 and aa01.aaa101=?")
                ;
        List<Map<String,String>> list =  this.queryForList(sql.toString(), aaa101);
        parseBBSList(list);
        parseBBSListForUser(list);
        return list;
    }

    private void parseBBSListForUser(List<Map<String, String>> list) {
        for (int i = 0; i < list.size(); i++) {
            list.get(i).put("isUser", "1");
        }
    }

    /**
     * 用户发帖
     * @return
     */
    public boolean post() throws Exception{

        Object aaa101 = this.get("userID");
        Object aaa303 = this.get("aaa303");

        Object aaa304 = this.get("aaa304");

        /*
        解析正文，把base64转为路径
         */
        String text = (String) this.get("aaa304");

        text = BBSTools.parseBBSText(text, this.get("filePath") + "\\");


        Object aaa306 = this.get("aaa306");
        StringBuilder sql = new StringBuilder()
                .append("INSERT INTO aa03 ( aaa101, aaa302, aaa303, aaa304, aaa305, aaa306 )")
                .append("VALUES")
                .append("	( ?, CURRENT_TIMESTAMP, ?, ?, 0 ,?)")
                ;
        return this.executeUpdate(sql.toString(),aaa101,aaa303,text,aaa306) > 0;
    }

    /**
     * 获取帖子列表
     * @return
     */
    public List<Map<String, String>> queryForList() throws Exception{
        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	aaa301, ")
                .append("	aaa303, ")
                .append("	aaa304, ")
                .append("	aaa302, ")
                .append("	aaa306, ")
                .append("	aaa103 ")
                .append("FROM ")
                .append("	aa03,aa01 ")
                .append("WHERE ")
                .append("	(aaa301 != 1  ")
                .append("	AND aaa305 = 0) ")
                .append("	and aa01.aaa101 = aa03.aaa101 ")
                ;
        List<Map<String,String>> list =  this.queryForList(sql.toString());
        parseBBSList(list);
        return list;
    }

    private void parseBBSList(List<Map<String,String>> list) {
        for(Map<String,String> map : list){
            String aaa306 = map.get("aaa306");
            if(aaa306.length() > 100){
                aaa306 = aaa306.replace(aaa306.substring(100), "......");
                map.put("aaa306", aaa306);
            }

        }
    }

    /**
     * 获取单个帖子以及所有回复
     * @return
     */
    public List<Map<String, String>> queryForSingle() throws Exception{
        Object aaa301 = this.get("aaa301");
        StringBuilder sql = new StringBuilder()
                .append("SELECT" )
                .append("	aaa301, ")
                .append("	aaa302, ")
                .append("	aaa303, ")
                .append("	aaa304, ")
                .append("	aaa103 ")
                .append("FROM ")
                .append("	aa03 ,aa01 ")
                .append("WHERE ")
                .append("	(aaa301 = ? ")
                .append("	OR aaa305 = ?) ")
                .append("	AND aa01.aaa101=aa03.aaa101 ")
                .append("ORDER BY ")
                .append("	aaa305 ")
                ;
        return this.queryForList(sql.toString(), aaa301,aaa301);
    }

    public boolean comment() throws Exception{
        Object aaa101 = this.get("userID");
        String aaa304 = (String) this.get("aaa304");
        Object aaa305 = this.get("aaa301");
        StringBuilder sql = new StringBuilder()
                .append("INSERT INTO aa03 ( aaa101, aaa302, aaa304, aaa305 ) ")
                .append("VALUES" )
                .append("	( ?, CURRENT_TIMESTAMP, ?, ? ) ")
                ;
        return this.executeUpdate(sql.toString(), aaa101, aaa304,aaa305) > 0;
    }

    public boolean del() throws Exception{
        int aaa301 = Integer.valueOf((String)this.get("aaa301"));
        String sql = "delete from aa03 WHERE aaa301 = ?";
        return this.executeUpdate(sql, aaa301) > 0;
    }
}

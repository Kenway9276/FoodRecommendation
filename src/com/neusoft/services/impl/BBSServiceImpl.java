package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.db.RedisUtils;
import com.neusoft.system.tools.BBSTools;
import com.neusoft.system.tools.Base64Utils;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BBSServiceImpl extends JdbcServicesSupport {
    @Override
    public Map<String, String> findById() throws Exception {
        return null;
    }

    /**
     * 获取帖子列表for用户
     * @return
     * @throws Exception
     */
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

        Map<String,String> map = new HashMap<>();
        map.put("currentPage", Integer.toString(getCurrentPage()));
        map.put("totalPages",Integer.toString(getPageCount()));
        list.add(map);
        parseBBSListForUser(list);
        return list;
    }

    /**
     * 获取当前页的帖子列表
     * @return
     * @throws Exception
     */
    public List<Map<String, String>> queryForPage() throws Exception {
        // 当前页码
        int page = this.getCurrentPage();


        // 当前页数第一个帖子在list中的索引
        int begin = (page - 1) * 12;
        // 当前页数最后第一个帖子在list中的索引
        int end = begin + 12;
        end = end > getBBSCount() ? getBBSCount() : end;
        System.out.println("begin: "+begin);
        System.out.println("end: "+end);

        List<Map<String,String>> list = (List<Map<String,String>>)RedisUtils.SerializableGet("list");
        System.out.println(list);
        list = list.subList(begin, end);
        Map<String,String> map = new HashMap<>();
        map.put("currentPage", Integer.toString(getCurrentPage()));
        map.put("totalPages",Integer.toString(getPageCount()));
        list.add(map);
        return list;
    }

    /**
     * 获取总帖子数
     * @return
     */
    public int getBBSCount() throws Exception{
        return ((List)RedisUtils.SerializableGet("list")).size();
    }

    /**
     * 获取总页数
     * 一页展示12个帖子
     * @return
     * @throws Exception
     */
    public int getPageCount() throws Exception{
        int res = ((List)RedisUtils.SerializableGet("list")).size();
        res = res / 12 + 1;
        return res;
    }

    private void parseBBSListForUser(List<Map<String, String>> list) {
        for (int i = 0; i < list.size(); i++) {
            list.get(i).put("isUser", "1");
        }
    }

    /**
     * 获取当前页码
     * @return
     */
    public int getCurrentPage() throws Exception{
        return this.get("currentPage") == null ? 1 : Integer.valueOf((String)this.get("currentPage")) ;
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
        RedisUtils.SerializableSet("list", list);
        Map<String,String> map = new HashMap<>();
        map.put("currentPage", Integer.toString(getCurrentPage()));
        map.put("totalPages",Integer.toString(getPageCount()));
        list.add(map);
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

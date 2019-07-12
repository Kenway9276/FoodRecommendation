package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;

import java.util.List;
import java.util.Map;

public class BBSServiceImpl extends JdbcServicesSupport {
    @Override
    public Map<String, String> findById() throws Exception {
        return null;
    }

    @Override
    public List<Map<String, String>> query() throws Exception {
        return null;
    }

    /**
     * 用户发帖
     * @return
     */
    public boolean post() throws Exception{
        // todo 获取用户id
        int aaa101 = 0;
        Object aaa303 = this.get("aaa303");
        Object aaa304 = this.get("aaa304");
        Object aaa306 = this.get("aaa306");
        StringBuilder sql = new StringBuilder()
                .append("INSERT INTO aa03 ( aaa101, aaa302, aaa303, aaa304, aaa305, aaa306 )")
                .append("VALUES")
                .append("	( ?, CURRENT_TIMESTAMP, ?, ?, 0 ,?)")
                ;
        return this.executeUpdate(sql.toString(),aaa101,aaa303,aaa304,aaa306) > 0;
    }

    /**
     * 获取帖子列表
     * @return
     */
    public List<Map<String, String>> queryForList() throws Exception{
        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	aaa303, ")
                .append("	aaa304, ")
                .append("	aaa302, ")
                .append("	aaa306 ")
                .append("FROM ")
                .append("	aa03 ")
                .append("	WHERE aaa301 != 1 and aaa305 = 0 ")
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
                .append("SELECT ")
                .append("	aaa301, aaa302,aaa303,aaa304 ")
                .append("FROM ")
                .append("	aa03  ")
                .append("WHERE ")
                .append("	aaa301 = ?  ")
                .append("	OR aaa305 = ? ")
                .append("	ORDER BY aaa305 ")
                ;
        return this.queryForList(sql.toString(), aaa301,aaa301);
    }

    public boolean comment() throws Exception{
        // todo 获取用户流水号
        Object aaa101 = 0;
        Object aaa304 = this.get("aaa304");
        Object aaa305 = this.get("aaa301");
        StringBuilder sql = new StringBuilder()
                .append("INSERT INTO aa03 ( aaa101, aaa302, aaa304, aaa305 ) ")
                .append("VALUES" )
                .append("	( ?, CURRENT_TIMESTAMP, ?, ? ) ")
                ;
        return this.executeUpdate(sql.toString(), aaa101, aaa304,aaa305) > 0;
    }
}

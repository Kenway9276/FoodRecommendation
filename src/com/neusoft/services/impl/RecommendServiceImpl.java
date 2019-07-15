package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.db.RedisUtils;

import java.util.*;

public class RecommendServiceImpl extends JdbcServicesSupport {


    @Override
    public Map<String, String> findById() throws Exception {
        return null;
    }

    /**
     * 获取用户推荐的一个列表
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String, String>> query() throws Exception {
        resetAa06();
        List<Map<String,String>> res = null;
        // 定义sql语句
        Object aaa203 = this.get("aaa203");
        Object aaa204 = this.get("aaa204");
        Object aaa202 = this.get("aaa202");

        if(aaa203 instanceof String[]){
            aaa203 = ((String[])aaa203)[0];
        }
        if(aaa204 instanceof String[]){
            aaa204 = ((String[])aaa204)[0];
        }
        if(aaa202 instanceof String[]){
            aaa202 = ((String[])aaa202)[0];
        }


        // todo 在sql语句中设置用户位置的参数和用户流水号的参数
        StringBuilder sql = new StringBuilder()
                .append("SELECT ab01.aab101, ")
                .append("	ab01.aab104,")
                .append("	ab01.aab106,")
                .append("	ab01.aab107,")
                .append("	ab01.aab111,")
                .append("	aab207,")
                .append("	aab205 AS cuisine,")
                .append("	aab206 AS category,")
                .append("	aab204 AS flavor,")
                .append("	aab402 AS state ")
                .append("FROM")
                .append("	ab01 ab01")
                .append("	LEFT JOIN ab02 ON ab02.aab101 = ab01.aab101")
                .append("	LEFT JOIN ab04 ON ab04.aab101 = ab01.aab101")
                .append("	LEFT JOIN aa06 ON aa06.aaa101 = 0 ")
                .append("	AND aa06.aab101 = ab01.aab101 ")
                .append("WHERE ")
                .append("TRUE ")
                ;
        //参数列表
        List<Object> paramList=new ArrayList<>();
        //逐一判断查询条件是否录入,拼接AND条件
        if(this.isNotNull(aaa202))
        {
            sql.append("	AND aab204 LIKE ? ");
            paramList.add("%"+aaa202+"%");
        }
        if(this.isNotNull(aaa203))
        {
            sql.append("	AND aab205 LIKE ? ");
            paramList.add("%"+aaa203+"%");
        }
        if(this.isNotNull(aaa204))
        {
            sql.append("	AND aab206 LIKE ? ");
            paramList.add("%"+aaa204+"%");

        }
        sql.append("	AND aaa602 >= 0");
        sql.append("	ORDER BY");
        sql.append("	aab402 DESC");
        sql.append("	LIMIT 1");
        System.out.println(sql.toString());
        res = this.queryForList(sql.toString(), paramList.toArray());
        if(res.size() > 0){
            Map tem = res.get(0);
            if(this.isNotNull(aaa202)){
                tem.put("aaa202", (String)aaa202);
            }
            if(this.isNotNull(aaa203)){
                tem.put("aaa203", (String)aaa203);
            }
            if(this.isNotNull(aaa204)){
                tem.put("aaa204", (String)aaa204);
            }
        }
        return res;
    }

    private void resetAa06() throws Exception{
        StringBuilder sql = new StringBuilder()
                .append("UPDATE aa06 ")
                .append("SET aaa602 = 0,")
                .append("aaa603 = CURRENT_TIMESTAMP ")
                .append("WHERE")
                .append("	aaa602 < 0 AND DATEDIFF( CURRENT_TIMESTAMP, aaa603 ) > 7")
                ;
        this.executeUpdate(sql.toString());
    }

    /**
     * 在页面上展示
     * @return
     * @throws Exception
     */
    public List<Map<String, String>> queryForIndex() throws Exception {
        //1.编写SQL语句
        StringBuilder sql=new StringBuilder()
                .append("select scode, sname, sfcode")
                .append("          from syscode")
                ;
        //填写的参数列表
        return this.queryForList(sql.toString());
    }

    public boolean updateSelectionPlus() throws Exception {
        // todo 在sql语句加入用户流水号参数
        StringBuilder sql = new StringBuilder()
                .append("UPDATE aa06 ")
                .append("SET aaa602 = aaa602 + 1, ")
                .append("aaa603 = CURRENT_TIMESTAMP ")
                .append("WHERE ")
                .append("	aab101 = ?;")
                ;
//        int aab101 = Integer.valueOf((String)this.get("aab101"));
        return this.executeUpdate(sql.toString(), this.get("aab101")) > 0;
    }

    public boolean updateSelectionSubtract() throws Exception {
        // todo 在sql语句加入用户流水号参数
        StringBuilder sql = new StringBuilder()
                .append("UPDATE aa06 ")
                .append("SET aaa602 = -1, ")
                .append("aaa603 = CURRENT_TIMESTAMP ")
                .append("WHERE ")
                .append("	aab101 = ?;")
                ;
        String[] tem = (String[])this.get("aab101");
        int aab101 = Integer.valueOf(tem[0]);
        return this.executeUpdate(sql.toString(), aab101) > 0;
    }
}

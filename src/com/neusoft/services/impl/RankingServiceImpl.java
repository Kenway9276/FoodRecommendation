package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;

import java.util.List;
import java.util.Map;

public class RankingServiceImpl extends JdbcServicesSupport {
    @Override
    public Map<String, String> findById() throws Exception {
        return null;
    }

    @Override
    public List<Map<String, String>> query() throws Exception {
        return null;
    }

    public List<Map<String, String>> queryForCity() throws Exception {
        String city = "%" + this.get("currentCity") + "%";

        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	aab104, ")
                .append("	aab101, ")
                .append("	aab106, ")
                .append("	aab113, ")
                .append("	aab107, ")
                .append("	aab111  ")
                .append("FROM ")
                .append("	ab01 ab01 ")
                .append("WHERE ")
                .append("	aab106 LIKE ? ")
                .append("ORDER BY ")
                .append("	aab111 DESC, ")
                .append("	aab114 DESC ")
                .append("	LIMIT 6 ")
                ;
        return queryForList(sql.toString(), city);
    }

    public List<Map<String, String>> queryForPopularity() throws Exception {
        String city = "%" + this.get("currentCity") + "%";
        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	COUNT( ac01.aab101 ) AS p, ")
                .append("	ac01.aab101, ")
                .append("	ab01.aab104, ")
                .append("	ab01.aab106, ")
                .append("	ab01.aab107, ")
                .append("	ab01.aab113, ")
                .append("	ab01.aab111, ")
                .append("	ab01.aab114 as co, ")
                .append("	COUNT( ac01.aab101 ) + ab01.aab114 as popularity ")
                .append("FROM ")
                .append("	ac01 ac01, ")
                .append("	ab01 ab01  ")
                .append("WHERE ")
                .append("	ab01.aab101 = ac01.aab101  ")
                .append("	AND ab01.aab106 LIKE ? ")
                .append("GROUP BY ")
                .append("	aab101 ")
                .append("ORDER BY ")
                .append("	popularity DESC ")
                ;
        return this.queryForList(sql.toString(), city);
    }


}

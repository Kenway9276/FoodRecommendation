package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class CouponServiceImpl extends JdbcServicesSupport {
    @Override
    public Map<String, String> findById() throws Exception {
        return null;
    }

    /**
     * չʾ�����е������Ż�ȯ
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String, String>> query() throws Exception {
        //todo ��ȡ��ǰ����
        Object aab507 = "%���%";
        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	a.aab101,")
                .append("	aab504, ")
                .append("	aab503, ")
                .append("	aab505, ")
                .append("	aab506, ")
                .append("	aab104,  ")
                .append("	aab501  ")
                .append("FROM ")
                .append("	ab05 a, ")
                .append("	ab01 b  ")
                .append("WHERE ")
                .append("	aab507 LIKE ?  ")
                .append("	AND aaa101 IS NULL  ")
                .append("	AND a.aab101 = b.aab101 ");
        return this.queryForList(sql.toString(), aab507);
    }

    public boolean publish() throws Exception{
        // todo ��ȡ��ǰ�̼�id����ȡ��ǰ����
        int aab101 = 2;
        String aab507 = "���";
        Object aab502 = this.get("aab502");
        Object aab503 = this.get("aab503");
        Object aab504 = this.get("aab504");
        Object aab505 = this.get("aab505");
        Object aab506 = this.get("aab506");

        StringBuilder sql = new StringBuilder()
                .append("INSERT INTO ab05 ( aab101, aab502, aab503, aab504, aab505, aab506, aab507 ) ")
                .append("VALUES ")
                .append("	( ?,?,?,?,?,?,?) ")
                ;
        return this.executeUpdate(sql.toString(), aab101, aab502, aab503, aab504, aab505, aab506,aab507) > 0;
    }

    private  String getCode(){
        Random r = new Random();
        int i = 0;
        StringBuilder res = new StringBuilder();
        for (int j = 0; j < 6; j++) {
            i = r.nextInt(10);
            res.append(i);
        }
        return res.toString();
    }

}

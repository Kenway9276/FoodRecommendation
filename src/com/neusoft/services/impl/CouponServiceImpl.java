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
     * 展示本城市的所有优惠券
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String, String>> query() throws Exception {
        // todo 用户已经领取的优惠券不会再出现，同样的优惠券不会重复出现
        //todo 获取当前城市
        Object aab507 = "%天津%";
        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	count( aab501 ) as remain, ")
                .append("	aab503, ")
                .append("	aab505, ")
                .append("	aab504, ")
                .append("	aab506, ")
                .append("	aab104 ,ab05.aab101  ")
                .append("FROM ")
                .append("	ab05, ")
                .append("	ab01  ")
                .append("WHERE ")
                .append("	ab05.aab101 = ab01.aab101  ")
                .append("	AND aaa101 IS NULL  ")
                .append("	AND aab506 > CURRENT_TIMESTAMP  ")
                .append("	AND aab507 LIKE ?  ")
                .append("GROUP BY ")
                .append("	aab503, ")
                .append("	aab505, ")
                .append("	aab504, ")
                .append("	aab104, ")
                .append("	aab506 ,aab101")
                ;
        return this.queryForList(sql.toString(), aab507);
    }

    public boolean publish() throws Exception{
        String tem = (String) this.get("count");
        int count = Integer.valueOf(tem);

        // todo 获取当前商家id，获取当前城市
        int aab101 = 2;
        String aab507 = "天津";

        Object aab503 = this.get("aab503");
        Object aab504 = this.get("aab504");
        Object aab505 = this.get("aab505");
        Object aab506 = this.get("aab506");

        StringBuilder sql = new StringBuilder()
                .append("INSERT INTO ab05 ( aab101, aab502, aab503, aab504, aab505, aab506, aab507 ) ")
                .append("VALUES ")
                .append("	( ?,?,?,?,?,?,?) ")
                ;
        Object aab502 = null;
        for (int i = 0; i < count; i++) {
            aab502 = this.getCode();
            this.apppendSql(sql.toString(), aab101, aab502, aab503, aab504, aab505, aab506,aab507);
        }
        return this.executeTransaction();
    }

    private  String getCode(){
        Random r = new Random();
        int i = 0;
        StringBuilder res = new StringBuilder();
        for (int j = 0; j < 12; j++) {
            i = r.nextInt(10);
            res.append(i);
        }
        return res.toString();
    }

    public boolean getCoupon() throws Exception{
        String sql = "UPDATE ab05 set aaa101 = ? where aab501 = ? and aab503 = ? and aab50";
        return this.executeUpdate(sql, this.get("aaa101"), this.get("aab501")) > 0;
    }

    public List<Map<String, String>> queryForUser() throws Exception{
        //todo 获取当前城市
        Object aab507 = "%天津%";
        Object aaa101 = 8;
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
                .append("	AND aaa101 = ?  ")
                .append("	AND a.aab101 = b.aab101 ")
                .append("	AND a.aab506 > CURRENT_TIMESTAMP ");
        List<Map<String, String>> list = this.queryForList(sql.toString(), aab507, aaa101);
        for (Map<String, String> map:list) {
            map.put("isUser", "1");
        }
        return list;
    }

    public boolean deleteCouponUser() throws Exception{
        String sql = "DELETE FROM ab05 WHERE aab501 = ?";
        return this.executeUpdate(sql, this.get("aab501")) > 0;
    }

    /**
     * 商家验证优惠券
     * @return
     */
    public Map<String,String> checkCoupon() throws Exception{
        Object aab502 = this.get("aab502").toString().toLowerCase();
        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	aab501, aaa101,aab503,aab504,aab505,aab507,aab502  ")
                .append("FROM ")
                .append("	ab05  ")
                .append("WHERE ")
                .append("	aaa101 IS NOT NULL  ")
                .append("	AND aab502 = ? AND CURRENT_DATE < aab506  ")
                ;
        return this.queryForMap(sql.toString(),aab502 );
    }

    /**
     * 商家验证优惠券之后删除
     * @return
     * @throws Exception
     */
    public boolean delCoupon() throws Exception{
        Object aab501 = this.get("aab501");
        String sql = "delete from ab05 where aab501 = ?";
        return this.executeUpdate(sql, aab501) > 0;
    }
}

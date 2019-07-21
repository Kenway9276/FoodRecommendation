package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;

import java.util.*;

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

    public Map<String, String> getCoupon() throws Exception{
        Map<String, String> res = new HashMap<>();
        Object aaa101 = this.get("userID");
        String sql = "select aab501,aaa101 from ab05 where aab101 = ? and aab503 = ? and aab506 = ? and aab504 = ? and aab505 = ?";
        Object aab101 = this.get("aab101");
        Object aab503 = this.get("aab503");
        Object aab506 = this.get("aab506");
        Object aab504 = this.get("aab504");
        Object aab505 = this.get("aab505");

        List<Map<String, String>> list = this.queryForList(sql, aab101,aab503,aab506,aab504,aab505);
        String aab501 = list.get(0).get("aab501");
        for(Map<String, String> map : list){
            if (map.get("aaa101") == null){
                continue;
            }
            if(map.get("aaa101").equals(aaa101) || map.get("aaa101") == aaa101){
                res.put("msg", "领取失败，不能多次领取");
                return res;
            }
        }
        String sql2 = "UPDATE ab05 set aaa101 = ? where aab501 = ? ";
        this.executeUpdate(sql2, aaa101, aab501);
        res.put("msg", "领取成功");
        return res;
    }

    public List<Map<String, String>> queryForUser() throws Exception{
        //todo 获取当前城市
        Object aab507 = "%天津%";
        Object aaa101 = this.get("userID");
        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	a.aab101,")
                .append("	aab504, ")
                .append("	aab503, ")
                .append("	aab505, ")
                .append("	aab506, ")
                .append("	aab104,  ")
                .append("	aab501,  ")
                .append("	aab502  ")
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

    public List<Map<String, String>> queryForShop() throws Exception{
        StringBuilder sql = new StringBuilder()
                .append("SELECT ")
                .append("	COUNT(*) AS count ,aab504,aab503,aab505,aab506 ")
                .append("FROM ")
                .append("	ab05  ")
                .append("	WHERE ")
                .append("	aab101 = ? ")
                .append("GROUP BY ")
                .append("	aab504,aab503,aab505,aab506")
                ;
        return this.queryForList(sql.toString(), this.get("busiID"));
    }
}

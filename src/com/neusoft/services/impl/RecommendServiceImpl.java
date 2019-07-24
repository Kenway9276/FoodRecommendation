package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.db.RedisUtils;
import org.apache.taglibs.standard.util.EscapeXML;


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


        List<Map<String,String>> res = null;

        // 优先推荐没有被选择过的
        res = queryForNew();

        resetAa06();

        // 定义sql语句
        Object aaa203 = this.get("aaa203");
        Object aaa204 = this.get("aaa204");
        Object aaa202 = this.get("aaa202");
        Object aaa101 = this.get("userID");

        // 根据口味获取口味流水号，如果为空则插入到口味列表
        getPreferenceID(aaa203, aaa204, aaa202);

        if(aaa203 instanceof String[]){
            aaa203 = ((String[])aaa203)[0];
        }
        if(aaa204 instanceof String[]){
            aaa204 = ((String[])aaa204)[0];
        }
        if(aaa202 instanceof String[]){
            aaa202 = ((String[])aaa202)[0];
        }



        StringBuilder sql = new StringBuilder()
                .append("SELECT ab01.aab101, ")
                .append("	ab01.aab104,")
                .append("	ab01.aab106,")
                .append("	ab01.aab107,")
                .append("	ab01.aab111,")
                .append("	ab01.aab113,")
                .append("	aab207,")
                .append("	aab205 AS cuisine,")
                .append("	aab206 AS category,")
                .append("	aab204 AS flavor,")
                .append("	aab402 AS state ")
                .append("FROM")
                .append("	ab01 ab01")
                .append("	LEFT JOIN ab02 ON ab02.aab101 = ab01.aab101")
                .append("	LEFT JOIN ab04 ON ab04.aab101 = ab01.aab101")
                .append("	LEFT JOIN aa06 ON aa06.aaa101 = ? ")
                .append("	AND aa06.aab101 = ab01.aab101 ")
                .append("WHERE ")
                .append("TRUE ")
                ;
        //参数列表
        List<Object> paramList=new ArrayList<>();
        paramList.add(aaa101);
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
            res.get(0).put("aaa202",(String) aaa202);
            res.get(0).put("aaa203",(String) aaa203);
            res.get(0).put("aaa204",(String) aaa204);
        }

        return res;
    }

    private void getPreferenceID(Object aaa203, Object aaa204, Object aaa202) throws Exception{

        Object aaa206 = this.get("currentCity");
        Object aaa101 = this.get("userID");
        List<Object> params = new ArrayList<>();
        String sql = "select aaa201 from aa02 where true ";
        if(aaa203 != null){
            params.add(aaa203);
            sql += " and aaa203 = ? ";
        }
        if(aaa204 != null){
            params.add(aaa204);
            sql += " and aaa204 = ? ";
        }
        if(aaa202 != null){
            params.add(aaa202);
            sql += " and aaa202 = ? ";
        }

        List list =  this.queryForList(sql, params.toArray());
        if(list.size() == 0){
            sql = "insert into aa02 (aaa101,aaa202,aaa203,aaa204,aaa206) values (?,?,?,?,?)";
            this.executeUpdate(sql, aaa101,aaa202,aaa203,aaa204,aaa206);
        }
    }

    private String getPreferenceID2(Object aaa203, Object aaa204, Object aaa202) throws Exception{
        Object aaa206 = this.get("currentCity");
        Object aaa101 = this.get("userID");
        List<Object> params = new ArrayList<>();
        String sql = "select aaa201 from aa02 where true ";
        if(aaa203 != null){
            params.add(aaa203);
            sql += " and aaa203 = ? ";
        }
        if(aaa204 != null){
            params.add(aaa204);
            sql += " and aaa204 = ? ";
        }
        if(aaa202 != null){
            params.add(aaa202);
            sql += " and aaa202 = ? ";
        }

        List<Map<String,String>> list =  this.queryForList(sql, params.toArray());
        if(list.size() > 0){
            return list.get(0).get("aaa201");
        }
        return "null";
    }

    public String getPreferenceIDWithoutFlavour(Object userID) throws Exception{
        String sql = "select aaa201 from aa02 where aaa101 = ? and aaa202 is null and aaa203 is null and aaa204 is null";
        Map<String, String> res = this.queryForMap(sql, userID);
        return res.get("aaa201");
    }

    private List<Map<String, String>> queryForNew() {
        return null;
    }

    /**
     * 被选择数为负数的超过7天的商店能够再次被推荐
     * @throws Exception
     */
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
        Object aaa101 = this.get("userID");
        StringBuilder sql = new StringBuilder()
                .append("UPDATE aa06 ")
                .append("SET aaa602 = aaa602 + 1, ")
                .append("aaa603 = CURRENT_TIMESTAMP ")
                .append("WHERE ")
                .append("	aab101 = ? and aaa101 = ?;")
                ;
        Object aab101 = getaab101();
        return this.executeUpdate(sql.toString(), aab101,aaa101) > 0;
    }

    public boolean updateSelectionSubtract() throws Exception {
        Object aaa101 = this.get("userID");
        StringBuilder sql = new StringBuilder()
                .append("UPDATE aa06 ")
                .append("SET aaa602 = -1, ")
                .append("aaa603 = CURRENT_TIMESTAMP ")
                .append("WHERE ")
                .append("	aab101 = ? and aaa101=?;")
                ;

        Object aab101 = this.get("aab101");
        return this.executeUpdate(sql.toString(), aab101,aaa101) > 0;
    }

    private Object getaab101(){
        Object aab101 = this.get("aab101");
        if(aab101 instanceof String[]){
            aab101 = ((String[])this.get("aab101"))[0];
        }
        return aab101;
    }

    public Map<String, String> getRecommend2() throws Exception{
        resetAa06();

        Object aaa202 = this.get("aaa202");
        Object aaa203 = this.get("aaa203");
        Object aaa204 = this.get("aaa204");

        List<Map<String, String>> list = null;

        // 初步筛选，获取口味暂时相似的餐厅
        list = getFlavorList();

        // 解析list，如果用户选择表中没有关于该商家的数据——插入
        parseRecommendListToSelectTable(list);

        // 解析list，如果用户选择表中被选择次数小于零，则从推荐列表中去除该商家
        parseRecommendListRemove(list);

        // 解析list，更新成一个商家对应多个餐厅的形式
        if(list.size() > 0){
            list =  parseRecommendList(list);
        }

        // 解析list，放入偏好流水号
        for (Map<String, String> map :list) {
            map.put("aaa201", getPreferenceID2(aaa203, aaa204, aaa202));
        }

        // 存到缓存中
        RedisUtils.SerializableSet("recommend_list", list);

        List<Map<String, String>> res_list = (List<Map<String, String>>)RedisUtils.SerializableGet("recommend_list");
        if(res_list.size() > 0){
            Map<String, String> res_map = res_list.get(0);
            res_list.remove(0);
            RedisUtils.SerializableSet("recommend_list", res_list);
            return res_map;
        }

        return null;
    }

    private void parseRecommendListRemove(List<Map<String, String>> list) throws Exception {
        Iterator<Map<String, String>> it = list.iterator();
        while (it.hasNext())
        {
            Map<String, String> current_map = it.next();
            String aab101 = current_map.get("aab101");
            Object aaa101 = this.get("userID");
            String sql = "SELECT aaa602 from aa06 where aaa101 = ? and aab101 = ?";
            Map<String, String> tem = this.queryForMap(sql, aaa101, aab101);
            if(Integer.valueOf(tem.get("aaa602")) <= 0){
                it.remove();
            }
        }
    }

    private List<Map<String, String>> parseRecommendListOrder(List<Map<String, String>> list) {
        return list;
    }

    private void parseRecommendListToSelectTable(List<Map<String, String>> list) throws Exception{
        for(Map<String, String> ins : list){
            String aab101 = ins.get("aab101");
            Object aaa101 = this.get("userID");
            String sql = "SELECT aaa601 from aa06 where aaa101 = ? and aab101 = ?";
            List res_from_db =  this.queryForList(sql, aaa101, aab101);
            if(res_from_db.size() == 0){
                sql = "insert into aa06 (aaa101, aab101, aaa602,aaa603) VALUES (?,?,1,CURRENT_TIMESTAMP)";
                this.executeUpdate(sql, aaa101, aab101);
            }
        }
    }

    private List<Map<String, String>> parseRecommendList(List<Map<String, String>> list) {
        List<Map<String, String>> res = new ArrayList<>();
        HashMap<String, String> map = new HashMap<>();
        String tem_shop_id = list.get(0).get("aab101");
        int count = 0;
        for(Map<String, String> ins : list){
            if(ins.get("aab101").equals(tem_shop_id)){
                String tem = ins.get("aab207");
                String menu = "";
                if(map.get("aab207") == null){
                    menu = tem;
                    map.put("aab101", ins.get("aab101"));
                    map.put("aab104", ins.get("aab104"));
                    map.put("aab106", ins.get("aab106"));
                    map.put("aab107", ins.get("aab107"));
                    map.put("aab113", ins.get("aab113"));
                    map.put("aab111", ins.get("aab111"));
                }
                else {
                    menu = map.get("aab207") + "," + tem;
                }
                map.put("aab207", menu);
            }
            else {
                res.add((Map<String, String>)map.clone());
                map = new HashMap<>();
                String tem = ins.get("aab207");
                map.put("aab207", tem);
                map.put("aab101", ins.get("aab101"));
                map.put("aab106", ins.get("aab106"));
                map.put("aab107", ins.get("aab107"));
                map.put("aab113", ins.get("aab113"));
                map.put("aab104", ins.get("aab104"));
                map.put("aab111", ins.get("aab111"));
                tem_shop_id = ins.get("aab101");
            }
            if(count == list.size() - 1){
                res.add(map);
            }
            count++;
        }
        return res;
    }

    private List<Map<String, String>> getFlavorList() throws Exception {

        Object currentCity = "%" + this.get("currentCity") +"%";
        System.out.println(currentCity);
        // 定义sql语句
        Object aaa203 = this.get("aaa203");
        Object aaa204 = this.get("aaa204");
        Object aaa202 = this.get("aaa202");
        Object aaa101 = this.get("userID");

        // 根据口味获取口味流水号，如果为空则插入到口味列表
        getPreferenceID(aaa203, aaa204, aaa202);

        StringBuilder sql = new StringBuilder()
                .append("SELECT DISTINCT ")
                .append("	ab01.aab104, ")
                .append("	ab01.aab101, ")
                .append("	ab01.aab106, ")
                .append("	ab01.aab107, ")
                .append("	ab01.aab111, ")
                .append("	ab01.aab113, ")
                .append("	aab207, ")
                .append("	aab205, ")
                .append("	aab206, ")
                .append("	aab204	 ")
                .append("FROM ")
                .append("	ab01 ab01 ")
                .append("	LEFT JOIN ab02 ON ab02.aab101 = ab01.aab101  ")
                .append("WHERE ")
                .append("	 ab01.aab105 = 1  ")
                .append("	AND aab207 IS NOT NULL  and ab01.aab106 like ?")

                ;
        //参数列表
        List<Object> paramList=new ArrayList<>();
        paramList.add(currentCity);
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
        return this.queryForList(sql.toString(), paramList.toArray());
    }

    public Map<String, String> getNextRecommend() throws Exception{
        List<Map<String, String>> res_list = (List<Map<String, String>>)RedisUtils.SerializableGet("recommend_list");
        if(res_list.size() > 0){
            Map<String, String> res_map = res_list.get(0);
            res_list.remove(0);
            RedisUtils.SerializableSet("recommend_list", res_list);
            return res_map;
        }
        return null;
    }
}

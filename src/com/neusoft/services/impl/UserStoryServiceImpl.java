package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserStoryServiceImpl extends JdbcServicesSupport {

    /**
     * 注册天数
     * @return
     */
    private Map<String, String> dayCount() throws Exception{
        Object aaa101 = this.get("userID");
        String sql = "SELECT (CURRENT_DATE - aaa110) as days from aa01 where aaa101 = ?";
        return this.queryForMap(sql, aaa101);
    }

    /**
     * 偏好数量
     * @return
     */
    private Map<String, String> preferenceCount() throws Exception{
        Object aaa101 = this.get("userID");
        String sql = "SELECT count(aaa101) as preferences from aa02  where aaa101 = ? group by aaa101";
        return this.queryForMap(sql, aaa101);
    }

    /**
     * 订座数量
     * @return
     */
    private Map<String, String> bookCount() throws Exception{
        Object aaa101 = this.get("userID");
        String sql = "select count(aaa101) as books from ac01 where aaa101 = ? and aac106 GROUP BY aaa101";
        return this.queryForMap(sql, aaa101);
    }

    /**
     * 城市数量
     * @return
     */
    private Map<String, String> cityCount() throws Exception{
        Object aaa101 = this.get("userID");
        String sql = "SELECT count(aaa206) as preferences from aa02  where aaa101 = ? group by aaa206";
        List<Map<String, String>> list =  this.queryForList(sql, aaa101);
        Map<String, String> map = new HashMap<>();
        map.put("cities", Integer.toString(list.size()));
        return map;
    }

    /**
     * 用户最喜欢的口味
     * @return
     */
    private Map<String, String> tasteFavorite() throws Exception{
        Object aaa101 = this.get("userID");
        String sql = "SELECT aaa201,aaa202,aaa203,aaa204 from aa02 WHERE aaa201 = (" +
                "SELECT  aaa201 from ac01 where aaa101 = ? and aac106 = 1 GROUP BY aaa201 ORDER BY count(aaa201) DESC LIMIT 1)";
        Map<String, String> map = new HashMap<>();
        map = this.queryForMap(sql, aaa101);
        //解析：把数字转换成中文
        if(map != null){
            parseCodeList(map, "aaa202");
            parseCodeList(map, "aaa203");
            parseCodeList(map, "aaa204");
            return map;
        }

        return null;
    }

    @Override
    public List<Map<String, String>> query() throws Exception {
        List<Map<String, String>> list = new ArrayList<>();
        list.add(dayCount());
        if(preferenceCount() != null){
            list.get(0).putAll(preferenceCount());
        }
        if(bookCount() != null){
            list.get(0).putAll(bookCount());
        }
        if(cityCount() != null){
            list.get(0).putAll(cityCount());
        }
        if(tasteFavorite() != null){
            list.get(0).putAll(tasteFavorite());
        }
        return list;
    }


}

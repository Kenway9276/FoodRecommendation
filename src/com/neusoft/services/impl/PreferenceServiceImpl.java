package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PreferenceServiceImpl extends JdbcServicesSupport {
    @Override
    public Map<String, String> findById() throws Exception {
        System.out.println("PreferenceServiceImpl:findById");
        return null;
    }

    @Override
    /**
     * 在添加用户偏好页面上展示偏好列表
     */
    public List<Map<String, String>> query() throws Exception {
        //TODO 登陆后 获取当前用户的流水号
        String aaa101 = "0";

        //1.编写SQL语句
        StringBuilder sql=new StringBuilder()
                .append("select aaa201, aaa202, aaa203, aaa204, aaa205, aaa206, aaa207")
                .append("          from aa02")
                .append("          where aaa101 = ?")
                ;
        //偏好列表
        List<Map<String, String>> tems = this.queryForList(sql.toString(), aaa101);
        for (int i = 0; i < tems.size(); i++) {
            tems.get(i).put("qaaa204", tems.get(i).get("aaa204"));
            tems.get(i).put("qaaa202", tems.get(i).get("aaa202"));
            tems.get(i).put("qaaa203", tems.get(i).get("aaa203"));
            //获取一条偏好并把代码替换为中文
            parseCodeList(tems.get(i),"aaa204");
            parseCodeList(tems.get(i),"aaa202");
            parseCodeList(tems.get(i),"aaa203");
        }
        return tems;
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

    public Map<String, String> queryForSelection() throws Exception {

        String sql= "SELECT aaa202, aaa203, aaa204 from aa02 where aaa201 = ?";
        this.queryForMap(sql, this.get("aaa201"));
        return null;
    }

    /**
     * 把形如:"1，2，3"解析成"川菜，粤菜"这样的类型
     * @param tem   dto
     * @param labelName 列名如aaa203
     * @throws Exception
     */
    private void parseCodeList(Map<String, String> tem, String labelName)throws Exception {
        String[] elements = tem.get(labelName).split(",");
        for(int i = 0; i < elements.length; i++){
            elements[i] = convertCodeToName(elements[i], labelName);
        }
        tem.put(labelName, Tools.joinArray(elements)) ;
    }

    /**
     * 获取syscode中代码对应的中文
     * 比如aaa203中1对应私房菜
     * @param code
     * @param labelName
     * @return
     * @throws Exception
     */
    private String convertCodeToName(String code, String labelName) throws Exception{
        String sql = "select sname from syscode where sfcode='"+labelName+"' and scode = '"+code+"'";
        List<Map<String,String>> list =  this.queryForList(sql);
        if(list.size() > 0){
            return list.get(0).get("sname");
        }
        else {
            return "";
        }
    }

    /**
     * 添加用户偏好
     * @return
     * @throws Exception
     */
    private boolean addPreference()throws Exception
    {
        //TODO 获取当前用户的流水号
        String aaa101 = "0";

        // TODO 将aaa206(地址)传给许泽松的地图模块解析


        //1.编写SQL语句
        StringBuilder sql=new StringBuilder()
                .append("insert into aa02(aaa101, aaa202, aaa203, aaa204, aaa206)")
                .append("          values(?,?,?,?,?)")
                ;
        //2.编写参数数组
        Object args[]={
                aaa101,
                Tools.joinArray(this.get("aaa202")),
                Tools.joinArray(this.get("aaa203")),
                Tools.joinArray(this.get("aaa204")),
                "天津"
        };
        return this.executeUpdate(sql.toString(), args)>0;
    }

    private boolean deleteById()throws Exception
    {
        String sql="delete from aa02 where aaa201=?";
        return this.executeUpdate(sql, this.get("aaa201")) > 0;
    }
}

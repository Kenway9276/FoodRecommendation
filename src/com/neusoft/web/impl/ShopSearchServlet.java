package com.neusoft.web.impl;

public class ShopSearchServlet extends RankingControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForCity");
        this.savePageMsg("title", "优秀餐厅推荐");
        this.savePageData("rows2", "queryForPopularity");
        this.savePageMsg("title2", "人气餐厅推荐");
        return "ranking";
    }
}

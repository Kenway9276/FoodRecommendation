package com.neusoft.web.impl;

public class RankingServlet extends RankingControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForPopularity");
        this.savePageMsg("title", "人气餐厅推荐");
        this.savePageData("rows2", "queryForCity");
        this.savePageMsg("title2", "优秀餐厅推荐");
        return "ranking";
    }
}

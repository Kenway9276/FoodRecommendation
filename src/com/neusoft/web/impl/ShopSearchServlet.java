package com.neusoft.web.impl;

public class ShopSearchServlet extends RankingControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForCity");
        this.savePageMsg("title", "��������Ƽ�");
        this.savePageData("rows2", "queryForPopularity");
        this.savePageMsg("title2", "���������Ƽ�");
        return "ranking";
    }
}

package com.neusoft.web.impl;

public class RankingServlet extends RankingControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForPopularity");
        this.savePageMsg("title", "���������Ƽ�");
        this.savePageData("rows2", "queryForCity");
        this.savePageMsg("title2", "��������Ƽ�");
        return "ranking";
    }
}

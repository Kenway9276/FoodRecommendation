package com.neusoft.web.impl;

public class RankingCityServlet extends RankingControllerSupport{
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForCity");
        this.savePageMsg("title", "��������Ƽ�");
        return "ranking";
    }
}

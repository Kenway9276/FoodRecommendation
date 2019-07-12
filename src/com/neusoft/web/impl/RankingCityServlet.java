package com.neusoft.web.impl;

public class RankingCityServlet extends RankingControllerSupport{
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForCity");
        this.savePageMsg("title", "ÓÅĞã²ÍÌüÍÆ¼ö");
        return "ranking";
    }
}

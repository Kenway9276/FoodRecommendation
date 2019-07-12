package com.neusoft.web.impl;

public class RankingPopularityServlet extends RankingControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForPopularity");
        this.savePageMsg("title", "ÈËÆø²ÍÌüÍÆ¼ö");
        return "ranking";
    }
}

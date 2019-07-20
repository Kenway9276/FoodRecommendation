package com.neusoft.web.impl;

public class RecommendGetServlet extends RecommendControllerSupport{

    @Override
    public String execute() throws Exception {
        this.savePageInstance("rows", "getRecommend2");
        return "tem";
    }
}

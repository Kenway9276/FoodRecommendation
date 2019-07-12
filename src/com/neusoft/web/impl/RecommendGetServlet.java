package com.neusoft.web.impl;

public class RecommendGetServlet extends RecommendControllerSupport{

    @Override
    public String execute() throws Exception {
        this.savePageData();
        return "tem";
    }
}

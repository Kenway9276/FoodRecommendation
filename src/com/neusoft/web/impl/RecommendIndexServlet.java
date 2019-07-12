package com.neusoft.web.impl;

public class RecommendIndexServlet extends RecommendControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("headers", "queryForIndex");
        return "recommend";
    }
}

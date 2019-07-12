package com.neusoft.web.impl;

public class RecommendSelectServlet extends RecommendControllerSupport{
    @Override
    public String execute() throws Exception {
        // 把被选择数加一
        this.update("updateSelectionPlus", "updateSelectionPlus");
        // todo 跳转到商家详细页面

        return "recommend";
    }
}

package com.neusoft.web.impl;

public class RecommendNextServlet extends RecommendControllerSupport {
    @Override
    public String execute() throws Exception {
        // 把被选择数减一
        this.update("updateSelectionSubtract", "updateSelectionSubtract");
        // 获取下一个推荐商家
        //this.savePageData("headers", "queryForIndex");
        //this.savePageData();
        this.savePageInstance("rows", "getNextRecommend");
        return "tem";
    }
}

package com.neusoft.web.impl;

public class RecommendNextServlet extends RecommendControllerSupport {
    @Override
    public String execute() throws Exception {
        // �ѱ�ѡ������һ
        this.update("updateSelectionSubtract", "updateSelectionSubtract");
        // ��ȡ��һ���Ƽ��̼�
        //this.savePageData("headers", "queryForIndex");
        //this.savePageData();
        this.savePageInstance("rows", "getNextRecommend");
        return "tem";
    }
}

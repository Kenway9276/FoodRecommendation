package com.neusoft.web.impl;

public class RecommendSelectServlet extends RecommendControllerSupport{
    @Override
    public String execute() throws Exception {
        // �ѱ�ѡ������һ
        this.update("updateSelectionPlus", "updateSelectionPlus");
        // todo ��ת���̼���ϸҳ��

        return "recommend";
    }
}

package com.neusoft.web.impl;

public class PreferenceAddServlet extends PreferenceControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("addPreference", "���", "��ӳɹ�,��ƫ����ˮ����:", "aaa201");
        this.savePageData();
        this.savePageData("headers", "queryForIndex");
        return "preference";
    }
}

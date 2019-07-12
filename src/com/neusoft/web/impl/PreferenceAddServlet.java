package com.neusoft.web.impl;

public class PreferenceAddServlet extends PreferenceControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("addPreference", "添加", "添加成功,该偏好流水号是:", "aaa201");
        this.savePageData();
        this.savePageData("headers", "queryForIndex");
        return "preference";
    }
}

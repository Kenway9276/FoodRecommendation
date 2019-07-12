package com.neusoft.web.impl;

public class PreferenceSelectServlet extends PreferenceControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("headers", "queryForIndex");

        return "preference";
    }
}

package com.neusoft.web.impl;

public class PreferenceIndexServlet extends PreferenceControllerSupport{
    @Override
    public String execute() throws Exception {
        this.savePageData("headers", "queryForIndex");
        this.savePageData();
        return "preference";
    }
}

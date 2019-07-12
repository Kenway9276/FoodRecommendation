package com.neusoft.web.impl;

public class PreferenceDeleteServlet extends PreferenceControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("deleteById", "É¾³ý");
        this.savePageDataForDelete();
        this.savePageData("headers", "queryForIndex");
        return "preference";
    }
}

package com.neusoft.web.impl;

public class BBSBrowseServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows2", "queryForList");
        this.savePageData("rows", "queryForPage");
        return "browse";
    }
}

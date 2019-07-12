package com.neusoft.web.impl;

public class BBSBrowseServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForList");
        return "browse";
    }
}

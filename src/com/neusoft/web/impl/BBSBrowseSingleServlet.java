package com.neusoft.web.impl;

public class BBSBrowseSingleServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        savePageData("rows", "queryForSingle");
        return "single";
    }
}

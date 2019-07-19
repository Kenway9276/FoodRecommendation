package com.neusoft.web.impl;

public class BBSBrowseForPageServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForPage");
        return "ajax";
    }
}

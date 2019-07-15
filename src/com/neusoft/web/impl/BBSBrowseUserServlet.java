package com.neusoft.web.impl;

public class BBSBrowseUserServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "query");
        return "browse";
    }
}

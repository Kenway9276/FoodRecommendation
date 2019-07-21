package com.neusoft.web.impl;

public class BBSBrowseAllServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("initCache", "»º´æ");
        this.savePageData("rows", "queryForPage");
        return "browse";
    }
}

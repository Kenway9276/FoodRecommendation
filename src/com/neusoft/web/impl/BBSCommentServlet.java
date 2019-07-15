package com.neusoft.web.impl;

public class BBSCommentServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("comment","ÆÀÂÛ");
        savePageData("rows", "queryForSingle");
        return "single";
    }
}

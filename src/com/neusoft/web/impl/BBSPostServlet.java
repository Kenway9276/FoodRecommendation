package com.neusoft.web.impl;

public class BBSPostServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("post","����");
        this.update("initCache", "����");
        this.savePageData("rows", "queryForPage");
        return "browse";
    }
}

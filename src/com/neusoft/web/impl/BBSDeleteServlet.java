package com.neusoft.web.impl;

public class BBSDeleteServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("del", "ɾ��");
        this.savePageData("rows", "query");
        return "browse";
    }
}

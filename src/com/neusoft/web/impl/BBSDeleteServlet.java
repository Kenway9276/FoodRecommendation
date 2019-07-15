package com.neusoft.web.impl;

public class BBSDeleteServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("del", "É¾³ý");
        this.savePageData("rows", "query");
        return "browse";
    }
}

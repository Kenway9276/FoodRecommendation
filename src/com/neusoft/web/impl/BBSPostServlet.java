package com.neusoft.web.impl;

public class BBSPostServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("post","·¢Ìû");
        this.update("initCache", "»º´æ");
        this.savePageData("rows", "queryForPage");
        return "browse";
    }
}

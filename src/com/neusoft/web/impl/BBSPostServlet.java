package com.neusoft.web.impl;

public class BBSPostServlet extends BBSControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("post","����");
        return "index";
    }
}
